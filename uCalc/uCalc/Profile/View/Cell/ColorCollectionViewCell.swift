//
//  ColorCollectionViewCell.swift
//  uCalc
//
//  Created by Alumnos on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var screenImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func identifier() -> String{
        return "ColorCollectionViewCell"
    }
    
    
    
}
