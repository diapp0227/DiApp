//
//  TimeCalcViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class TimeCalcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
}

private extension TimeCalcViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "時間計算"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                            target: self,
                                                            action: #selector(tapNavigationClose))
        
    }
    
    @objc func tapNavigationClose(_ sender : Any) {
        dismiss(animated: true)
    }
}
