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
        border.borderColor = ThemeHelper.defaultColor().accentColor.CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth , width: textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    static func blendColors( firstColor : UIColor, secondColor : UIColor, ratio : Float) -> UIColor{
        
        let rgb1 = firstColor.rgb()!
        let rgb2 = secondColor.rgb()!
        
        let newRatio = min(1, ratio)
        let inverseRatio = 1 - newRatio
        
        let r = CGFloat(rgb1.red) * CGFloat(newRatio) + CGFloat(rgb2.red) * CGFloat(inverseRatio)
        let g = CGFloat(rgb1.green) * CGFloat(newRatio) + CGFloat(rgb2.green) * CGFloat(inverseRatio)
        let b = CGFloat(rgb1.blue) * CGFloat(newRatio) + CGFloat(rgb2.blue) * CGFloat(inverseRatio)
        
    
        return UIColor(red: Int(r), green: Int(g), blue: Int(b))
    }
    
}
