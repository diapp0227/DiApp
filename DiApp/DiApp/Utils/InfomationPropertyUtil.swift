//
//  InfomationPropertyUtil.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/15.
//

import Foundation

class InfomationPropertyUtil {
    
    enum InfoPlistKeys: String {
        /// Bundle Identifier
        case identifier = "CFBundleIdentifier"
        /// アプリ名
        case name = "CFBundleName"
        /// ローカル・アプリ名
        case displayName = "CFBundleDisplayName"
        /// バージョン
        case shortVersion = "CFBundleShortVersionString"
        /// Buildバージョン
        case version = "CFBundleVersion"
        /// 休憩時間 (分単位)
        case breakTime = "BreakTime(Minute)"
    }
    
    static func getInfoPlistValue(key: InfoPlistKeys) -> Any? {
        Bundle.main.object(forInfoDictionaryKey: key.rawValue)
    }
}
