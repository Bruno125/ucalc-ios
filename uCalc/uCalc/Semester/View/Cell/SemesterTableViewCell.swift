//
//  SemesterTableViewCell.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class SemesterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    
    @IBOutlet weak var firstItemLabel: UILabel!
    @IBOutlet weak var secondItemLabel: UILabel!
    @IBOutlet weak var thirdItemLabel: UILabel!
    
    
    @IBOutlet weak var percentajeIndicatorView: UIView!
    @IBOutlet weak var percentajeWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var percentajeLabel: UILabel!
    
    
    var mSemester : Semester?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        containerView.layer.masksToBounds = false;
        containerView.layer.shadowOffset = CGSizeMake(0, 4);
        containerView.layer.shadowRadius = 3;
        containerView.layer.shadowOpacity = 0.5;
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func identifier() -> String{
        return "SemesterTableViewCell"
    }
    
    
    func setData(semester: Semester){
        
        mSemester = semester;
        
        if (mSemester) == nil{ //If semester is nil
            return;
        }
        
        titleLabel.text = semester.name;
        //creditsLabel.text = semester.totalCredits()
        
        
    }
    
    
}
