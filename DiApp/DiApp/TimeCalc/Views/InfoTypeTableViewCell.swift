//
//  InfoTypeTableViewCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/15.
//

import UIKit

class InfoTypeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ viewController: UIViewController, title: String, didSelectRow: Int) {
        pickerView.dataSource = viewController as? UIPickerViewDataSource
        pickerView.delegate = viewController as? UIPickerViewDelegate
        
        titleText.text = title
        pickerView.selectRow(didSelectRow, inComponent: 0, animated: false)
    }
}
