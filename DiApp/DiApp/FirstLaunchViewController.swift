//
//  FirstLaunchViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class FirstLaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapTimeCalcAction(_ sender: Any) {
        presentTimeCalcViewController()
    }
        
}

private extension FirstLaunchViewController {
    
    func presentTimeCalcViewController() {
        guard let timeCalcViewController = TimeCalcViewController.initialNavigationController() else {
            return
        }
        present(timeCalcViewController, animated: true)
    }
    
}
