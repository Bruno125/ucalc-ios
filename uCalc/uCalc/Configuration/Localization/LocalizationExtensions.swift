//
//  LocalizationExtensions.swift
//  uCalc
//
//  Created by Alumnos on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    override public func awakeFromNib() {
        if let text = text {
            self.text = NSLocalizedString(text, comment: "")
        }
    }
    
}

extension UIButton {
    
    override public func awakeFromNib() {
        if titleLabel != nil && titleLabel!.text != nil{
            setTitle(NSLocalizedString((titleLabel?.text)!, comment: ""), forState: UIControlState.Normal)
        }
    }
    
}


extension UITextField {
    
    override public func awakeFromNib() {
        if let text = text {
            self.text = NSLocalizedString(text, comment: "")
        }
    }
    
}
