//
//  WritingTableViewCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/08.
//

import UIKit

class WritingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
}
