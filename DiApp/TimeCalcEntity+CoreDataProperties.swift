//
//  TimeCalcEntity+CoreDataProperties.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/28.
//
//

import Foundation
import CoreData


extension TimeCalcEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeCalcEntity> {
        return NSFetchRequest<TimeCalcEntity>(entityName: "TimeCalcEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var leaving: Date?
    @NSManaged public var work: Date?
    @NSManaged public var number: Int64
    @NSManaged public var infoType: Int64
    @NSManaged public var memo: String?
    @NSManaged public var remarks: String?

}

extension TimeCalcEntity : Identifiable {

}
