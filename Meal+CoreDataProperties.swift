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

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var imageData: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var timestamp: Int32
    @NSManaged public var schedule: NSObject?

}
