//
//  ProfileHeaderTableViewCell.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageview: UIImageView!
    @IBOutlet weak var nameInititalsButton: RoundedButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    
    
    static func identifier() -> String{
        return "ProfileHeaderTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let color = ThemeHelper.defaultColor()
        
        backgroundImageview.image = color.backgroundImage
        nameInititalsButton.backgroundColor = color.accentColor
        nameInititalsButton.setImage(UIImage.tintedImage("ic_student"), forState: UIControlState.Normal)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
