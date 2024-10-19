//
//  FirstLaunchCollectionViewCell.swift
//  DiApp
//
//  Created by garigari0118 on 2024/10/19.
//

import UIKit

class FirstLaunchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: UIImage?) {
        guard let image else {
            return
        }
        self.imageView.image = image
        updateColor(false)
    }
    
    func updateColor(_ isSelect: Bool) {
        tintColor = isSelect ? .blue : .black
    }
}
