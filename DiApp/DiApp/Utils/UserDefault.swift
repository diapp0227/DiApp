//
//  UserDefaults.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/19.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T?
    
    var wrappedValue: T? {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}
