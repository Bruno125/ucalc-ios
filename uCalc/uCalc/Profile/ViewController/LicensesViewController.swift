//
//  LicencesViewController.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/21/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class LicensesViewController: UcalcViewController,UITableViewDataSource,UITableViewDelegate {

    let mLicences = [
        License(name: "realm"),
        License(name: "swiftyJSON")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("Licenses", comment: "")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mLicences.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : LicensesTableViewCell = tableView.dequeueReusableCellWithIdentifier(LicensesTableViewCell.identifier()) as! LicensesTableViewCell
        cell.setData(mLicences[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Redirect to library repo
        let url = mLicences[indexPath.row].getUrl()
        UIApplication.sharedApplication().openURL(NSURL(string: url)!)
        
        //Animate deselection
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    

}
