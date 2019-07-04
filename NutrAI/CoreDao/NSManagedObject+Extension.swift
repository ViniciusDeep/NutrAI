//
//  NSManagedObject+Extension.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//
import CoreData

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}
