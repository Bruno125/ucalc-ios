//
//  LicencesTableViewCell.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/21/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

struct License {
    let name : String?
    
    func getName()-> String{
        return NSLocalizedString("\(name!)", comment: "")
    }
    
    func getDescription() -> String{
        return NSLocalizedString("\(name!)_desc", comment: "")
    }
    func getUrl() -> String{
        return NSLocalizedString("\(name!)_url", comment: "")
    }
    
}

class LicensesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func identifier() -> String{
        return "LicensesTableViewCell"
    }
    
    func setData(license : License){
        nameLabel.text = license.getName()
        descriptionLabel.text = license.getDescription()
        
        nameLabel.textColor = ThemeHelper.defaultColor().mainColor
    }
    

}
