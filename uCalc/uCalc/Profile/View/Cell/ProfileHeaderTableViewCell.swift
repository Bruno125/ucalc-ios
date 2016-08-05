//
//  ProfileHeaderTableViewCell.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameInititalsLabel: UILabel!
    @IBOutlet weak var backgroundImageview: UIImageView!
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
        nameInititalsLabel.backgroundColor = color.mainDarkColor
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
