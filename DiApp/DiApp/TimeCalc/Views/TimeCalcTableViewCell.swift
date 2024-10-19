//
//  TimeCalcTableViewCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/25.
//

import UIKit

class TimeCalcTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leavingLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var diffDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(entity: TimeCalcEntity?) {
        guard let entity else {
            return
        }
        dateLabel.text = entity.date?.toString(formatType: .monthAndDay)
        leavingLabel.text = entity.leaving?.toString(formatType: .hhmm)
        workLabel.text = entity.work?.toString(formatType: .hhmm)
        diffDate.text = entity.getDiffDate()
    }
    
}
