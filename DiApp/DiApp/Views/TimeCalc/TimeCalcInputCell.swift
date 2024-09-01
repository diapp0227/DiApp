//
//  TimeCalcInputCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/01.
//

import UIKit

class TimeCalcInputCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// コンテンツの設定
    /// - Parameters:
    ///   - title: タイトル文言
    ///   - mode: Pickerの表示形式を指定
    func setContents(title: String, mode: UIDatePicker.Mode = .time) {
        titleLabel.text = title
        datePicker.datePickerMode = mode
    }
}