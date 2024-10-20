//
//  WeatherView.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/19.
//

import SwiftUI

struct WeatherView: View {
    
    @State var infoText = ""
    
    let viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("天気情報")
            Button("取得する") {
                fetchInfo()
            }
            Text("\(infoText)")
        }
    }
    
    func fetchInfo() {
        viewModel.fetchWeather() {
            infoText = viewModel.getDisplayInfoText()
        }
    }
}

#Preview {
    WeatherView()
}
