//
//  WeatherView.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/19.
//

import SwiftUI

struct WeatherView: View {
    
    @State var fetchInfo = ""
    
    var body: some View {
        VStack {
            Text("天気情報")
            Button("取得する") {
                fetchInfo = ""
            }
            Text("\(fetchInfo)")
        }
    }
}

#Preview {
    WeatherView()
}
