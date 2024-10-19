//
//  TimeCalcViewModel.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/25.
//

import UIKit

class TimeCalcViewModel: NSObject {
    
    /// tableView内に表示する内容
    enum Section: Int, CaseIterable {
        /// 日付要素
        case entity
        /// 追加ボタン
        case addButton
        
        /// tableview.dequeueReusableCellで設定するクラス名
        var identifierName: String {
            switch self {
            case .entity:
                return "TimeCalcTableViewCell"
            case .addButton:
                return "TimeCalcAddElementsCell"
            }
        }
        
        /// 各SectionのRowの数 (行数)
        var numberOfRows: Int {
            switch self {
            case .entity:
                // CoreDataに保存している要素数
                return CoreDataRepository.shared.getTimeCalcEntity().count
            case .addButton:
                return 1
            }
        }            
    }
    
    /// tableView内に表示する内容
    let section: [Section] = [.entity,
                              .addButton]
    
    /// 日付情報
    private(set) var entityCoreData: [TimeCalcEntity] = []
    
    /// 日付情報を更新
    func updateEntityData() {
        entityCoreData = CoreDataRepository.shared.getTimeCalcEntity()
    }

    /// 日付情報取得
    /// - Parameter number: 要素の項番
    func getTimeCalcEntity(number: Int) -> TimeCalcEntity? {
        guard number < entityCoreData.count else {
            return nil
        }
        return entityCoreData[number]
    }
    
}
