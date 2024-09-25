//
//  DateExtension.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/25.
//

import Foundation

extension Date {
    
    enum DateFormatType: String {
        case monthAndDay = "MM/dd"
        case hhmm = "HH:mm"
        case dateAll = "yyyy/MM/dd HH:mm:ss: Z"
    }
    
    func toString(formatType: DateFormatType) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = formatType.rawValue
        return formatter.string(from: self)
    }
}
