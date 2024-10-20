//
//  FirstLaunchViewModel.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/19.
//

import UIKit
import SwiftUI

class FirstLaunchViewModel {
    
    enum Destination: CaseIterable {
        /// 時間入力
        case timeCalc
        /// お天気情報
        case weather
        /// Webview学習用
        case webView
        
        /// 画面表示文言
        var title: String {
            switch self {
            case .timeCalc:
                return "時間入力"
            case .weather:
                return "お天気情報"
            case .webView:
                return "webview学習用"
            }
        }
        
        /// 画面構成についての表示文言
        var screenType: String {
            switch self {
            case .timeCalc:
                return "StoryBoard"
            case .weather:
                return "SwiftUI"
            case .webView:
                return "---"
            }
        }
        
        /// 説明文言
        var explanation: String {
            switch self {
            case .timeCalc:
                return """
勤怠時間を保存する画面を表示します。\n\n
【実装内容】\n
・TableView\n
・CoreData\n
・Date(日付操作)\n
・NavigationController\n
"""
            case .weather:
                return """
天気情報を確認できる画面を表示します。\n\n
【実装内容】\n
・dataTask\n
・非同期処理
"""
            case .webView:
                return "アプリ内でWebviewを表示します。\n\n【未実装】"
            }
        }
        
        /// 表示画像
        var image: UIImage? {
            switch self {
            case .timeCalc:
                return UIImage(systemName: "timer")
            case .weather:
                return UIImage(systemName: "wifi")
            case .webView:
                return UIImage(systemName: "paperplane")
            }
        }
        
        var viewController: UIViewController? {
            switch self {
            case .timeCalc:
                return TimeCalcViewController.initialNavigationController()
            case .weather:
                return UIHostingController(rootView: WeatherView())
            case .webView:
                return nil
            }
        }
        
    }
    
    /// 選択中の移動先
    private(set) var selectedDestination: Int = .zero
    
    /// 移動先
    var destinationList: [Destination] {
        Destination.allCases
    }
    
    func setSelectedDestination(_ number: Int) {
        selectedDestination = number
    }
}
