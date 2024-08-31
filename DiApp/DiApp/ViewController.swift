//
//  ViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapTimeCalcAction(_ sender: Any) {
        presentTimeCalcViewController()
    }
        
}

private extension ViewController {

    var timeCalcViewController: TimeCalcViewController? {
        UIStoryboard(name: "TimeCalc", bundle: nil).instantiateInitialViewController() as? TimeCalcViewController
    }
    
    func presentTimeCalcViewController() {
        guard let timeCalcViewController = timeCalcViewController else {
            return
        }
        
        present(timeCalcViewController, animated: true)
    }
    
}
