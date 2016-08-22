//
//  AddSemesterView.swift
//  uCalc
//
//  Created by Alumnos on 8/4/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit
import RealmSwift

protocol SemesterDialogDelegate {
    func didSaveSemester()
}

class SemesterDialogView: UIView,UITextFieldDelegate {

    
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var semesterTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var semesterCheckButton: UIButton!
    @IBOutlet weak var courseCheckButton: UIButton!
    
    private var parentController : UIViewController?
    var delegate : SemesterDialogDelegate?
    
    static func present(controller: UIViewController, delegate : SemesterDialogDelegate) -> SemesterDialogView{
        let arr = NSBundle.mainBundle().loadNibNamed("SemesterDialogView", owner: controller, options: nil)
        let view = arr[0] as! SemesterDialogView
        view.setup()
        view.parentController = controller
        view.delegate = delegate
        
        UIView.transitionWithView(controller.view, duration: 0.4, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                controller.view.addSubview(view)
                view.displayBars(false)
            }, completion: nil)
        
        return view
    }
    
    // MARK: - Setup views
    
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(SemesterDialogView.handleTap(_:)))
        
        visualEffectView.addGestureRecognizer(tap)
        
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
    
    // MARK: - Actions
    
    @IBAction func saveTouchUp(sender: AnyObject) {
        if semesterTextField.text == nil || (semesterTextField.text?.isEmpty)!{
            return
        }
        
        let realm = try! Realm()
        let semester = Semester()
        semester.name = semesterTextField.text!
        semester.roundSemesterGrade = semesterCheckButton.tag == 1
        semester.roundCourseGrade = courseCheckButton.tag == 1
        try! realm.write {
            realm.add(semester)
        }
        
        close()
        
        if delegate != nil {
            delegate!.didSaveSemester()
        }
        
    }
    
    @IBAction func cancelTouchUp(sender: AnyObject) {
        close()
    }
    
    private func close() {
        removeFromSuperview()
        UIView.transitionWithView(parentController!.view, duration: 0.4, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.displayBars(true)
            }, completion: nil)
        

    }
    
    // MARK: - Own funcions
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        semesterTextField.resignFirstResponder()
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //textField.resignFirstResponder()
        return true
    }
    
    private func displayBars( display : Bool){
        /*if let navController = parentController!.navigationController{
            // If has navigation bar, hide it
            navController.navigationBar.layer.zPosition = display ? 1 :  -1
            if let tabController = navController.tabBarController {
                //If has tab bar, hide it
                tabController.tabBar.layer.zPosition = display ? 1 :  -1
            }
        }*/
    }
    
    
}