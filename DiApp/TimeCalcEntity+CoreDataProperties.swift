//
//  TimeCalcEntity+CoreDataProperties.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/10.
//
//

import Foundation
import CoreData


extension TimeCalcEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeCalcEntity> {
        return NSFetchRequest<TimeCalcEntity>(entityName: "TimeCalcEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var work: Date?
    @NSManaged public var leaving: Date?

}

extension TimeCalcEntity : Identifiable {

}
