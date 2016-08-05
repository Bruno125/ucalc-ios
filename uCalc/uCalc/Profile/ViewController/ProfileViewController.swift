//
//  ProfileViewController.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ProfileViewController: UcalcViewController, UITableViewDelegate, UITableViewDataSource {

    class Option {
        var title : String?
        var description : String?
        var selector : Selector?
        var showDisclosure : Bool = true
        
        init(title: String, desc: String, selector : Selector, showDisclosure : Bool){
            self.title = NSLocalizedString(title, comment: "")
            self.description = NSLocalizedString(desc, comment: "")
            self.selector = selector
            self.showDisclosure = showDisclosure
        }
        
        init(title: String, desc: String, selector : Selector){
            self.title = NSLocalizedString(title, comment: "")
            self.description = NSLocalizedString(desc, comment: "")
            self.selector = selector
        }
        
        init(title: String, desc: String){
            self.title = NSLocalizedString(title, comment: "")
            self.description = NSLocalizedString(desc, comment: "")
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    let mOptions = [
        Option(title: "option_color_title", desc: "option_color_desc", selector: #selector(openChangeColor)),
        Option(title: "option_feedback_title", desc: "option_feedback_desc", selector: #selector(openFeedback)),
        Option(title: "option_licenses_title", desc: "option_licenses_desc", selector: #selector(openLicenses)),
        Option(title: "option_version_title", desc: "v\(NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String)", selector: nil, showDisclosure: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: ProfileHeaderTableViewCell.identifier(),bundle: nil), forCellReuseIdentifier: ProfileHeaderTableViewCell.identifier())
        tableView.registerNib(UINib(nibName: OptionTableViewCell.identifier(),bundle: nil), forCellReuseIdentifier: OptionTableViewCell.identifier())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + mOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell =  tableView.dequeueReusableCellWithIdentifier(ProfileHeaderTableViewCell.identifier()) as! ProfileHeaderTableViewCell
            cell.setEditSelector(self, selector: #selector(openEditInfo))
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(OptionTableViewCell.identifier()) as! OptionTableViewCell
            let option = mOptions[indexPath.row-1]
            cell.set(option.title!, description: option.description!)
            if option.showDisclosure{
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == 0{
            return false
        }
        return (mOptions[indexPath.row-1]).showDisclosure
    }
    
    // MARK: - Table Interactions
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            return
        }
        
        if let selector = (mOptions[indexPath.row-1] ).selector {
            performSelector(selector)
        }
        
        
    }
    
    func openEditInfo() {
        performSegueWithIdentifier("EditProfileSegue", sender: self)
    }
    
    func openChangeColor(){
        performSegueWithIdentifier("PickColorSegue", sender: self)
    }
    func openFeedback(){
        
    }
    func openLicenses(){
        
    }
    
    
    // MARK: - Show / hide navigation bar
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

}
