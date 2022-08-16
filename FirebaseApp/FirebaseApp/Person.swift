//
//  Person.swift
//  FirebaseApp
//
//  Created by Apple on 16.08.2022.
//

import Foundation
import Firebase


class Person {
    
    var per_name:String?
    var per_age:Int?
    
    
    init() {
        
    }
    
    init(perName:String?,perAge:Int?) {
        self.per_name = perName
        self.per_age = perAge
    }
}
