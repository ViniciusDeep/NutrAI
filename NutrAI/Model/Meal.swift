//
//  Meal.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Meal: Decodable {
    let name: String
    let calorie: Double
    let timestamp: Date
    let imageUrl: String
    
    init(name: String, calorie: Double, imageUrl: String) {
        self.name = name
        self.calorie = calorie
        self.imageUrl = imageUrl
        timestamp = Date()
    }
}
