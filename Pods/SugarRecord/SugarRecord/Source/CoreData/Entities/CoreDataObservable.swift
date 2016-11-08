#if os(iOS) || os(tvOS) || os(watchOS)
import Foundation
import CoreData

public class CoreDataObservable<T: NSManagedObject where T:Equatable>: RequestObservable<T>, NSFetchedResultsControllerDelegate {

    // MARK: - Attributes

    internal let fetchRequest: NSFetchRequest
    internal var observer: (ObservableChange<T> -> Void)?
    internal let fetchedResultsController: NSFetchedResultsController
    private var batchChanges: [CoreDataChange<T>] = []


    // MARK: - Init

    internal init(request: Request<T>, context: NSManagedObjectContext) {

        let fetchRequest: NSFetchRequest = NSFetchRequest(entityName: T.entityName)
        if let predicate = request.predicate {
            fetchRequest.predicate = predicate
        }
        if let sortDescriptor = request.sortDescriptor {
            fetchRequest.sortDescriptors = [sortDescriptor]
        }
        fetchRequest.fetchBatchSize = 0
        self.fetchRequest = fetchRequest
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init(request: request)
        self.fetchedResultsController.delegate = self
    }


    // MARK: - Observable

    public override func observe(closure: ObservableChange<T> -> Void) {
        assert(self.observer == nil, "Observable can be observed only once")
        let initial = try! self.fetchedResultsController.managedObjectContext.executeFetchRequest(self.fetchRequest) as! [T]
        closure(ObservableChange.Initial(initial))
        self.observer = closure
        _ = try? self.fetchedResultsController.performFetch()
    }


    // MARK: - Dipose Method
    
    override func dispose() {
        self.fetchedResultsController.delegate = nil
    }


    // MARK: - NSFetchedResultsControllerDelegate

    public func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            #if os(watchOS)
                self.batchChanges.append(.Delete(indexPath!.indexAtPosition(0), anObject as! T))
            #else
                self.batchChanges.append(.Delete(indexPath!.row, anObject as! T))
            #endif
        case .Insert:
            #if os(watchOS)
                self.batchChanges.append(.Insert(newIndexPath!.indexAtPosition(0), anObject as! T))
            #else
                self.batchChanges.append(.Insert(newIndexPath!.row, anObject as! T))
            #endif
        case .Update:
            #if os(watchOS)
                self.batchChanges.append(.Update(indexPath!.indexAtPosition(0), anObject as! T))
            #else
                self.batchChanges.append(.Update(indexPath!.row, anObject as! T))
            #endif
        default: break
        }
    }

    public func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.batchChanges = []
    }

    public func controllerDidChangeContent(controller: NSFetchedResultsController) {
        let deleted = self.batchChanges.filter { $0.isDeletion() }.map { $0.index() }
        let inserted = self.batchChanges.filter { $0.isInsertion() }.map { (index: $0.index(), element: $0.object()) }
        let updated = self.batchChanges.filter { $0.isUpdate() }.map { (index: $0.index(), element: $0.object()) }
        self.observer?(ObservableChange.Update(deletions: deleted, insertions: inserted, modifications: updated))
    }

}
#endif
