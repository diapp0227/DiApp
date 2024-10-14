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
    
    func getDiffDate() -> String {
        guard let work,
              let leaving,
              let diff = work.getDiffMinute(to: leaving),
              diff > .zero else {
            return ""
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: diff) ?? ""
    }
}

extension TimeCalcEntity : Identifiable {

}
