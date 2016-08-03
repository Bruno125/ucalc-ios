//
//  ThemeHelper.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ThemeHelper: NSObject {
    
    
    private static let PREF_THEME_COLOR = "theme_color"
    
    static func defaultColor() -> BaseColor{
        let color = NSUserDefaults.standardUserDefaults().stringForKey(PREF_THEME_COLOR)
        if color == nil {
            return ThemeColors.Blue()
        }
        return ThemeColors.colorForIdentifier(color!)
    }
    
    static func saveColor(color : BaseColor) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(color.label, forKey: PREF_THEME_COLOR)
    }
    
    static func updateTabAppeareance() {
        let appearance = UITabBar.appearance()
        appearance.tintColor = defaultColor().mainColor
        
    }
    
    
}
