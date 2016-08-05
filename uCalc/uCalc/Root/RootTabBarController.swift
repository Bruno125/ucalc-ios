//
//  RootTabBarController.swift
//  uCalc
//
//  Created by Alumnos on 8/2/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    let mTabs = [ Tabs.Semesters, Tabs.Profile]
    
    override func viewDidLoad() {
        setTabs()
    }
    
    /// Initialize the main application tabs
    func setTabs(){
        setTabsWithSelectedIndex(0)
        
    }
    
    
    func setTabsWithSelectedIndex(index : Int) {
        //Set tabs appeareance
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.opaque = true
        let appearance = UITabBar.appearance()
        appearance.translucent = true;
        appearance.opaque = false;
        ThemeHelper.updateTabAppeareance()
        
        //Create a navigation controller for each option
        var controller : NavigationTabViewController?
        var controllers = [NavigationTabViewController]()
        
        for tab in mTabs {
            switch tab {
            case Tabs.Semesters,
                 Tabs.Quick,
                 Tabs.Profile:
                controller = storyboard?.instantiateViewControllerWithIdentifier("NavigationTabViewController") as? NavigationTabViewController
                controller?.type = tab
                controller?.setPrincipalViewController()
            }
            
            controllers.append(controller!)
        }
        
        //Set custom controllers
        viewControllers = controllers

        //Set selected controller
        if index < mTabs.count {
            selectedViewController = viewControllers![index]
        }
        
    }
    
}
