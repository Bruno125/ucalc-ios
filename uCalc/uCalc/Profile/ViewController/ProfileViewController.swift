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
        
        init(title: String, desc: String){
            self.title = NSLocalizedString(title, comment: "")
            self.description = NSLocalizedString(desc, comment: "")
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    let mOptions = [
        Option(title: "option_color_title", desc: "option_color_desc"),
        Option(title: "option_feedback_title", desc: "option_feedback_desc"),
        Option(title: "option_licenses_title", desc: "option_licenses_desc"),
        Option(title: "option_version_title", desc: NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String )
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
            return tableView.dequeueReusableCellWithIdentifier(ProfileHeaderTableViewCell.identifier())!
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(OptionTableViewCell.identifier()) as! OptionTableViewCell
            let option = mOptions[indexPath.row-1]
            cell.set(option.title!, description: option.description!)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
