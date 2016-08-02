//
//  ViewFontExtensions.swift
//  uCalc
//
//  Created by Alumnos on 8/2/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    var style : String {
        get { return self.font.fontName }
        set {
            self.font = FontHelper.styleFor(newValue, size: self.font.pointSize)
            self.font = UIFont(name: newValue, size: self.font.pointSize)
        }
    }
    
    
}

extension UIButton {
    
    var style : String {
        get { return self.titleLabel!.font.fontName }
        set { self.titleLabel!.font = FontHelper.styleFor(newValue, size: self.titleLabel!.font.pointSize) }
    }
    
}

extension UITextField {
    
    var style : String {
        get { return self.font!.fontName }
        set { self.font = FontHelper.styleFor(newValue, size: self.font!.pointSize) }
    }
    
}
