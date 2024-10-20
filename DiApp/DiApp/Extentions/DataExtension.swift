//
//  DataExtension.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/20.
//

import Foundation

extension Data {
    
    func decodeJson() -> Any? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(WeatherResponse.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
}
