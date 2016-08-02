//
//  Semester.swift
//  uCalc
//
//  Created by Bruno Aybar on 8/1/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import Foundation
import RealmSwift

class Semester: Object {
    dynamic var name = ""
    dynamic var roundSemesterGrade = false
    dynamic var roundCourseGrade = false
    
    let courses = List<Course>()
    
    
    func totalCredits() -> Int {
        var total = 0
        for course : Course in courses{
            total += course.credits.value!
        }
        
        return total
    }
    
    
}
