//
//  User.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct User {
    var meals: [Meal]?
    var age: Int
    var weight: Double
    var calorieNeed: Double
    
    
    mutating func calculatedCalorie() {
        if age >= 18 && age <= 35 {
            self.calorieNeed = ((weight * 15.3) + 679) * 4
        }
    }
}

