//
//  RoundedButtonExtension.swift
//  uCalc
//
//  Created by Alumnos on 8/4/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    private func setup() {
        layer.cornerRadius = layer.frame.size.height / 2
        style = "regular"
        backgroundColor = ThemeHelper.defaultColor().mainColor
        
    }
    
}