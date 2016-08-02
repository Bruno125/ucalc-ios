//
//  FontHelper.swift
//  uCalc
//
//  Created by Alumnos on 8/2/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class FontHelper: NSObject {

    static func styleFor(style:String, size:CGFloat) -> UIFont{
        
        switch style {
        case "light":
            return defaultLight(size)
        case "bold":
            return defaulBold(size)
        case "regular":
            return defaultRegular(size)
        default:
            return defaultRegular(size)
        }
        
        
    }
    
    static func defaultRegular(size: CGFloat) -> UIFont{
        return UIFont(name: "CircularAirPro-Book", size: size)!
    }
    
    static func defaulBold(size: CGFloat) -> UIFont{
        return UIFont(name: "CircularAirPro-Bold", size: size)!
    }
    static func defaultLight(size: CGFloat) -> UIFont{
        return UIFont(name: "CircularAirPro-Light", size: size)!
    }
    
    
}
