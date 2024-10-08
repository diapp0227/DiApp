//
//  WritingTableViewCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/08.
//

import UIKit

protocol WritingTableViewCellDelegate: AnyObject {
    var inputText: String? { get }
}

class WritingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: WritingTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
}
