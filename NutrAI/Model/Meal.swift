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
    let imageData: Data
    let timestamp: Date
    
    init(name: String, imageData: Data) {
        self.name = name
        self.imageData = imageData
        self.timestamp = Date()
    }
}
