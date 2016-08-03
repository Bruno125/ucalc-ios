//
//  ProfileViewController.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var colorPicker: UIPickerView!
    
    var colors = ThemeColors.asList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.reloadAllComponents()
        setupPicker()
        
        
    }
    
    private func setupPicker(){
        let current = ThemeHelper.defaultColor()
        var index = 0
        for i in 0...colors.count{
            if current.label == colors[i].label{
                index = i
                break;
            }
        }
        colorPicker.selectRow(index, inComponent: 0, animated: false)
    }
    
    
    // MARK: - Picker Delegate & DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].label
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        ThemeHelper.saveColor(colors[row])
        AppDelegate.resetTabs()
        
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
