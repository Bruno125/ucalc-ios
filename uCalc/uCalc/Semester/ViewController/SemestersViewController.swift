//
//  SemestersViewController.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit
import CoreGraphics
import RealmSwift

class SemestersViewController: UcalcViewController,UITableViewDelegate,UITableViewDataSource,SemesterDialogDelegate,SemesterTableViewCellCallback {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noSemestersView: UIView!
    
    
    var semesters = [Semester]()
    
    
    override func viewDidLoad() {
        
        tableView.registerNib(UINib(nibName: SemesterTableViewCell.identifier(),bundle: nil),
                              forCellReuseIdentifier: SemesterTableViewCell.identifier())
        
        setupBarItems()
        showSemesters()
    }
    
    private func setupBarItems() {
        //Add + button at right
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_add_white"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(showAddDialog))
    }
    
    private func showSemesters() {
        let realm = try! Realm()
        let tempSemesters = realm.objects(Semester.self)
        semesters.removeAll()
        for semester in tempSemesters {
            semesters.append(semester)
        }
        
        noSemestersView.hidden = semesters.count > 0
        tableView.reloadData()
    }
    
    @IBAction func addSemesterTouchUp(sender: AnyObject) {
        showAddDialog()
    }
    
    func showAddDialog(){
        SemesterDialogView.present(self,delegate: self)
    }
    
    func didSaveSemester() {
        showSemesters()
    }
    
    
    // MARK: TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(SemesterTableViewCell.identifier()) as! SemesterTableViewCell
        
        let semester = semesters[indexPath.row]
        cell.setData(semester)
        cell.delegate = self;
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: Interaction with cell
    
    
    func requestedDelete(semester: Semester) {
        let alert = UIAlertController(title: NSLocalizedString("Remove semester", comment: ""), message: NSLocalizedString("Do you wish to remove this semester?", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
            let realm = try! Realm()
            try! realm.write {
                realm.delete(semester)
            }
            self.showSemesters()
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertActionStyle.Cancel, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
}
