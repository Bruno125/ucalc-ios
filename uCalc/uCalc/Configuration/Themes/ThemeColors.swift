//
//  ThemeColors.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

protocol BaseColor {
    var mainColor : UIColor {get}
    var mainDarkColor : UIColor {get}
    var accentColor : UIColor {get}
    var label : String {get}
    var backgroundImage : UIImage {get}
}

class ThemeColors {
    
    private static var mapper = [String : BaseColor]()
    
    static func asList() -> [BaseColor]{
        return [ Blue(), Pink(), Green(), Red(), Purple(), Orange() ]
    }
    
    static func asDict() -> [String : BaseColor] {
        if mapper.count < 1 {
            let colors = asList()
            for color in colors{
                mapper[color.label] = color
            }
        }
        return mapper
    }
    
    
    static func colorForIdentifier(identifier : String) -> BaseColor{
        return asDict()[identifier]!
    }
    
    
    class Red : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0xF44336)
        let mainDarkColor: UIColor = UIColor(netHex: 0xD32F2F)
        let accentColor: UIColor = UIColor(netHex: 0xFF4081)
        let label: String = "Red"
        var backgroundImage: UIImage = UIImage(named: "back_header_red")!
    }
    
    
    class Blue : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0x2196F3)
        let mainDarkColor: UIColor = UIColor(netHex: 0x1976D2)
        let accentColor: UIColor = UIColor(netHex: 0x8BC34A)
        let label: String = "Blue"
        var backgroundImage: UIImage = UIImage(named: "back_header_blue")!
    }
    
    class Green : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0x8BC34A)
        let mainDarkColor: UIColor = UIColor(netHex: 0x33691e)
        let accentColor: UIColor = UIColor(netHex: 0x8BC34A)
        let label: String = "Green"
        var backgroundImage: UIImage = UIImage(named: "back_header_green")!
    }
    
    class Pink : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0xFF4081)
        let mainDarkColor: UIColor = UIColor(netHex: 0xFE0055)
        let accentColor: UIColor = UIColor(netHex: 0xFF1262)
        let label: String = "Pink"
        var backgroundImage: UIImage = UIImage(named: "back_header_pink")!
    }
    
    class Yellow : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0xFFC107)
        let mainDarkColor: UIColor = UIColor(netHex: 0xFFA000)
        let accentColor: UIColor = UIColor(netHex: 0xFFA00)
        let label: String = "Yellow"
        var backgroundImage: UIImage = UIImage(named: "back_header_yellow")!
    }
    
    class Orange : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0xFF5722)
        let mainDarkColor: UIColor = UIColor(netHex: 0xE64A19)
        let accentColor: UIColor = UIColor(netHex: 0xFF5722)
        let label: String = "Orange"
        var backgroundImage: UIImage = UIImage(named: "back_header_yellow")!
    }
    
    
    class Purple : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0x673AB7)
        let mainDarkColor: UIColor = UIColor(netHex: 0x512DA8)
        let accentColor: UIColor = UIColor(netHex: 0xE040FB)
        let label: String = "Purple"
        var backgroundImage: UIImage = UIImage(named: "back_header_purple")!
    }
    
    
    class Gray : BaseColor {
        let mainColor: UIColor = UIColor(netHex: 0x607D8B)
        let mainDarkColor: UIColor = UIColor(netHex: 0x455A64)
        let accentColor: UIColor = UIColor(netHex: 0xE040FB)
        let label: String = "Gray"
        var backgroundImage: UIImage = UIImage(named: "back_header_grey")!
    }
}
