//
//  NavigationTabViewController.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit


enum Tabs {
    case Semesters, Quick, Profile
}


class NavigationTabViewController: UINavigationController {

    var type : Tabs?
    var firstController : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func setPrincipalViewController(){
        if type == nil{
            return
        }
        
        switch type! {
        case Tabs.Semesters:
            firstController = storyboard!.instantiateViewControllerWithIdentifier("SemestersViewController")
            firstController!.tabBarItem.title = NSLocalizedString("Semesters", comment: "")
            firstController!.tabBarItem.image = UIImage(named: "")
        case Tabs.Quick:
            firstController = storyboard!.instantiateViewControllerWithIdentifier("QuickPickerViewController")
            firstController!.tabBarItem.title = NSLocalizedString("Quick calculus", comment: "")
            firstController!.tabBarItem.image = UIImage(named: "")
        case Tabs.Profile:
            firstController = storyboard!.instantiateViewControllerWithIdentifier("ProfileViewController")
            firstController!.tabBarItem.title = NSLocalizedString("Profile", comment: "")
            firstController!.tabBarItem.image = UIImage(named: "")
        }
        
        if firstController == nil{
            return
        }
        
        setViewControllers([firstController!], animated: false)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
