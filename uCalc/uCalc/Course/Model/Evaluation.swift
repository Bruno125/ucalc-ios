//
//  Evaluation.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import RealmSwift

class Evaluation: Object {

    dynamic var label = ""
    dynamic var type = ""
    dynamic var weight : Double = 0.0
    let grade = RealmOptional<Double>()
    dynamic var saved = false
    
}
