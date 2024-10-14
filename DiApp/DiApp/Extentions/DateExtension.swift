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
    
    /// 時間差分をTimeIntervalで返却する
    /// - Parameter target: 比較するDate
    /// - Returns: 差分を返却する (値は反転させる)
    func getDiffMinute(to target: Date) -> TimeInterval? {
        self.timeIntervalSince(target) * -1
    }
}
