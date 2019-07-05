//
//  TimeManager.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class TimeManager {
    static func getCurrentTimer() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh"
        let hourString = formatter.string(from: Date())
        return hourString
    }
}
