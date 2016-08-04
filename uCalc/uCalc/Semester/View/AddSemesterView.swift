//
//  AddSemesterView.swift
//  uCalc
//
//  Created by Alumnos on 8/4/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class AddSemesterView: UIView,UITextFieldDelegate {

    
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var semesterTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var semesterCheckButton: UIButton!
    @IBOutlet weak var courseCheckButton: UIButton!
    
    var parentController : UIViewController?
    
    static func present(controller: UIViewController) -> AddSemesterView{
        let arr = NSBundle.mainBundle().loadNibNamed("AddSemesterView", owner: controller, options: nil)
        let view = arr[0] as! AddSemesterView
        view.setup()
        view.parentController = controller
        
        UIView.transitionWithView(controller.view, duration: 0.4, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                controller.view.addSubview(view)
                view.displayBars(false)
            }, completion: nil)
        
        return view
    }
    
    private func setup(){
        //Resize view to fill screen
        self.frame = UIScreen.mainScreen().bounds
        //Set default color to views
        let color = ThemeHelper.defaultColor()
        saveButton.backgroundColor = color.mainColor
        cancelButton.setTitleColor(color.accentColor, forState: UIControlState.Normal)
        
        //Set shadow to container and button
        UiUtils.applyShadow(containerView, radius: 3, opacity: 0.3)
        UiUtils.applyShadow(saveButton, radius: 3, opacity: 0.3)
        
        //Set images to checkboxes
        setupCheckBox(semesterCheckButton)
        setupCheckBox(courseCheckButton)
        
        //Set textfield style
        UiUtils.applyBottomBorder(semesterTextField, borderWidth: 1)
        
        //Set touch action to view
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddSemesterView.handleTap(_:)))
        
        visualEffectView.addGestureRecognizer(tap)
        
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        semesterTextField.resignFirstResponder()
    }

    
    private func setupCheckBox( view : UIButton) {
        view.tintColor = ThemeHelper.defaultColor().mainColor
        view.tag = 0
        view.setImage(UIImage.tintedImage("ic_check"), forState: UIControlState.Normal)

    }
    
    
    @IBAction func checkBoxTouchUp(sender: AnyObject) {
        if sender.isKindOfClass(UIButton){
            let button = sender as! UIButton
            button.tag = (button.tag + 1) % 2
            let imageName = button.tag == 0 ? "ic_check" : "ic_check_filled"
            button.setImage(UIImage.tintedImage(imageName), forState: UIControlState.Normal)
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func displayBars( display : Bool){
        if let navController = parentController!.navigationController{
            // If has navigation bar, hide it
            navController.navigationBar.layer.zPosition = display ? 1 :  -1
            if let tabController = navController.tabBarController {
                //If has tab bar, hide it
                tabController.tabBar.layer.zPosition = display ? 1 :  -1
            }
        }
    }
    
    
    
    @IBAction func saveTouchUp(sender: AnyObject) {
    }
    
    @IBAction func cancelTouchUp(sender: AnyObject) {
        removeFromSuperview()
        
        
        UIView.transitionWithView(parentController!.view, duration: 0.4, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.displayBars(true)
            }, completion: nil)
        
        
    }
    
}