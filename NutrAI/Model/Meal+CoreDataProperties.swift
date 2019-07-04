//
//  Meal+CoreDataProperties.swift
//  
//
//  Created by Vinicius Mangueira on 04/07/19.
//
//

import Foundation
import CoreData


extension Meal {
    convenience init(name: String, imageData: Data) {
        self.init()
        self.name = name
        self.imageData = imageData
        self.timestamp = Date()
    }
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var timestamp: Date?
}
