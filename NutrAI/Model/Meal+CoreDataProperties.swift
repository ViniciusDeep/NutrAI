//
//  Meal+CoreDataProperties.swift
//  
//
//  Created by Vinicius Mangueira on 04/07/19.
//
//

import CoreData


extension Meal {
    convenience init(name: String, imageData: Data, timestamp: Int32) {
        self.init()
        self.name = name
        self.imageData = imageData
        self.timestamp = timestamp
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageData: Data
    @NSManaged public var timestamp: Int32
    @NSManaged public var schedule: String?
    
 
    func setSchedule() {
        if self.timestamp >= 0 || self.timestamp <= 12 {
            schedule = ScheduleSection.breakfast.rawValue
        } else if self.timestamp >= 13 || self.timestamp <= 18 {
            schedule = ScheduleSection.lunch.rawValue
        } else {
            schedule = ScheduleSection.dinner.rawValue
        }
    }

}


enum ScheduleSection: String {
    case breakfast = "BreakFast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    
}
