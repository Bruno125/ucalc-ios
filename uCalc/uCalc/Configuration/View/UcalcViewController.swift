//
//  UcalcViewController.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class UcalcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let color = ThemeHelper.defaultColor()
        let appeareance = UITabBar.appearance()
        appeareance.tintColor = color.mainColor
        appeareance.barTintColor = UIColor.whiteColor()
        
        navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barTintColor = color.mainColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
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
