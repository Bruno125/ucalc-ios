//
//  BlurredView.swift
//  uCalc
//
//  Created by Alumnos on 8/4/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class BlurredView: UIView {

    var blurEffectView : UIVisualEffectView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(frame: CGRect){
        if !UIAccessibilityIsReduceTransparencyEnabled(){
            self.backgroundColor = UIColor.blackColor()
            return
        }
        
        self.backgroundColor = UIColor.clearColor()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = frame
        blurEffectView?.autoresizingMask = [ UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]

        self.addSubview(blurEffectView!)
    }
    

}
