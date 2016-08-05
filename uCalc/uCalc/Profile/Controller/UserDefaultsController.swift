//
//  UserDefaultsController.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/5/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class UserDefaultsController: NSObject {
    
    
    //User info
    static let FULLNAME = "fullname"
    static let UNIVERSITY = "university"
    static let CARRER = "career"
    static let MINIMUM_APPROVED_GRADE = "grade"
    
    
    private static func getDefaults() -> NSUserDefaults{
        return NSUserDefaults.standardUserDefaults()
    }
    
    static func getString(key: String) -> String{
        return getDefaults().stringForKey(key)!
    }
    
    static func getBool(key: String) -> Bool{
        return getDefaults().boolForKey(key)
    }
    
    static func getInt(key: String) -> Int{
        return getDefaults().integerForKey(key)
    }
    
    
    static func save(value: String, key: String){
        getDefaults().setObject(value, forKey: key)
    }
    
    static func remove(key : String) {
        getDefaults().removeObjectForKey(key)
    }
    
    
}
