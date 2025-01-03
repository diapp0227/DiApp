//
//  DiAppViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/28.
//

import UIKit

class DiAppViewController: UIViewController {
    
    static var className: String {
        String(describing: Mirror(reflecting: self).subjectType)
    }
    
    static var storyboardName: String {
        className.replacingOccurrences(of: ".Type", with: "")
    }
    
    static func initialNavigationController() -> UIViewController? {
        UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()
    }
}

extension DiAppViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
