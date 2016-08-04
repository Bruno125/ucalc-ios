//
//  UiUitls.swift
//  uCalc
//
//  Created by Alumnos on 8/4/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class UiUtils: NSObject {

    
    static func applyShadow(view : UIView, radius : CGFloat, opacity : Float){
        
        view.layer.masksToBounds = false;
        view.layer.shadowOffset = CGSizeMake(0, 4);
        view.layer.shadowRadius = radius;
        view.layer.shadowOpacity = opacity;
    }
    
    
    static func applyBottomBorder( textField: UITextField, borderWidth : CGFloat) {
        
        let border = CALayer()
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth , width: textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
}
