//
//  WeatherViewModel.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/20.
//

import Foundation

class WeatherViewModel {
    
    /// お天気APIの結果
    var response: WeatherResponse?
    
    let requestUrl = "https://api.openweathermap.org/data/2.5/weather?zip=169-0072,JP&appid=cc587b0dbfc776dfef84e5e33ce87ee4&lang=jp"
    
    func fetchWeather(completion: (() -> Void)?) {
        guard let url = URL(string: requestUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.decodeJson() as? WeatherResponse else {
                self.response = nil
                completion?()
                return
            }
            self.response = data
            Logger.log("response \(String(describing: self.response))")
            completion?()
        }
        task.resume()
    }
    
    func getDisplayInfoText() -> String {
        guard let response else {
            return "情報取得できませんでした。"
        }
        var infoText = ""
        infoText.append("場所:" + (response.name ?? "不明"))
        infoText.append("\n")
        infoText.append("天気:" + (response.weather?.first?.main ?? "不明"))
        return infoText
    }
}
