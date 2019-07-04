//
//  TheMealDBManager.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
//test implementation in TipsMealController
class TheMealDBManager {
    
    static func getMeals(completion: @escaping ([MealDB]?, Error?) -> Void) {
        let baseUrl = "https://www.themealdb.com/api/json/v1/1/latest.php"
        
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print("Fail consume data",err)
            }
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(FoodDB.self, from: data)
                completion(result.meals, nil)
            } catch let error {
                completion(nil, error)
                print("Fail decode",error)
            }
        }.resume()
    }
    
}

struct FoodDB: Decodable {
    let meals: [MealDB]?
}

struct MealDB: Decodable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strMealThumb: String
}
