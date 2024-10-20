//
//  WeatherViewModel.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/20.
//

import Foundation

class WeatherViewModel {
    
    let requestUrl = "https://api.openweathermap.org/data/2.5/weather?zip=169-0072,JP&appid=cc587b0dbfc776dfef84e5e33ce87ee4&lang=jp"
    
    func fetchWeather(completion: (() -> Void)?) {
        guard let url = URL(string: requestUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data else {
                return
            }
            Logger.log("data \(String(describing: String(data: data, encoding: .utf8)))")
            Logger.log("response \(String(describing: response))")
            completion?()
        }
        
        task.resume()
    }
    
    
}
