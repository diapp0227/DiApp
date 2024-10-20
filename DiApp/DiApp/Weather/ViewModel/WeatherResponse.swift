//
//  WeatherResponse.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/20.
//

struct WeatherResponse: Codable {
    var name: String?
    var weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case weather
    }
    
    enum WeatherKeys: String, CodingKey {
        case main
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        
        var weatherList: [Weather] = []
        var array = try values.nestedUnkeyedContainer(forKey: .weather)
        
        while(!array.isAtEnd) {
            let info = try array.decode(Weather.self)
            weatherList.append(info)
        }
        weather = weatherList
    }
}

struct Weather: Codable {
    var main: String?

    enum CodingKeys: String, CodingKey {
        case main
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        main = try values.decode(String.self, forKey: .main)
    }
}
