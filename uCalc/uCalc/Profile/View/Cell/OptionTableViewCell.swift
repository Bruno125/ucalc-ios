//
//  OptionTableViewCell.swift
//  uCalc
//
//  Created by Alumnos on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    static func identifier() -> String{
        return "OptionTableViewCell"
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(title: String, description: String){
        titleLabel.text = title
        descLabel.text = description
    }
    
}
