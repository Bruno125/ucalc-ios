//
//  Course.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import RealmSwift

class Course: Object {
    
    dynamic var name = ""
    dynamic var teacher : String? = nil
    let credits = RealmOptional<Int>()
    dynamic var semester : Semester?
    
    
    
}
