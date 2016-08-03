//
//  TintedImage.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    static func tintedImage(name : String) -> UIImage?{
        if let image = UIImage(named: name){
            return image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        }else{
            return nil
        }
    }
    
    static func tintedFromImage(image : UIImage?) -> UIImage?{
        if image == nil{
            return nil
        }
        return image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
    }
    
}