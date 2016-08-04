//
//  SemestersViewController.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit
import CoreGraphics

class SemestersViewController: UcalcViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var semesters = [Semester]()
    
    
    override func viewDidLoad() {
        
        tableView.registerNib(UINib(nibName: SemesterTableViewCell.identifier(),bundle: nil),
                              forCellReuseIdentifier: SemesterTableViewCell.identifier())
        
        for i in 0...10{
            let semester = Semester()
            semester.name = "Semester \(i)"
            
            semesters.append(semester)
        }
        
        
        tableView.reloadData()
        
        setupBarItems()
        
        
    }
    
    private func setupBarItems() {
        //Add + button at right
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_add_white"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(showAddDialog))
    }
    
    func showAddDialog(){
        AddSemesterView.present(self)
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
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    
}
