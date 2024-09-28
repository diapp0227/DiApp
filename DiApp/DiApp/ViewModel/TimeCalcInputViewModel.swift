//
//  TimeCalcInputViewModel.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/01.
//

import UIKit

class TimeCalcInputViewModel: NSObject {
    
    /// tableView内に表示する内容
    enum Section: Int, CaseIterable {
        /// 日付
        case date
        /// 出社時間
        case work
        /// 退社時間
        case leaving

        /// 表示タイトル
        var title: String {
            switch self {
            case .date:
                return "日付"
            case .work:
                return "出社時間"
            case .leaving:
                return "退社時間"
            }
        }
        
        /// pickerでの表示形式
        var pickerMode: UIDatePicker.Mode {
            switch self {
            case .date:
                return .date
            case .work, .leaving:
                return .time
            }
        }
    }
    
    enum InputType {
        /// 追加情報
        case add
        /// 編集
        case edit
    }
    
    /// tableView内に表示する内容
    private(set) var sections = [Section]()
    /// ユーザー編集前の表示情報
    private(set)var editBeforeEntity: TimeCalcEntity?
    /// 入力形式
    private(set)var inputType: InputType = .add
 
    
    override init() {
        super.init()
        
        setupSections()
    }

    /// tableView内に表示するSectionを設定する
    func setupSections() {
        Section.allCases.forEach {
            sections.append($0)
        }
    }
    
    /// 画面遷移初回に設定する想定
    func initialDisplayEntity(entity: TimeCalcEntity?) {
        guard let entity else {
            inputType = .add
            return
        }
        setEditBeforeEntity(entity: entity)
        inputType = .edit
    }
    
    private func setEditBeforeEntity(entity: TimeCalcEntity) {
        self.editBeforeEntity = entity
    }
    
    func getFirstDisplayEntityDate(section: Section) -> Date? {
        switch section {
        case .date:
            return editBeforeEntity?.date
        case .work:
            return editBeforeEntity?.work
        case .leaving:
            return editBeforeEntity?.leaving
        }
    }
}
