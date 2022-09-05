//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showOKAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showEditAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let editAction = UIAlertAction(title: "예",
                                       style: .default)
        let cancelAction = UIAlertAction(title: "아니오",
                                         style: .default)
        alert.addAction(editAction)
        alert.addAction(cancelAction)
        present(alert,
                animated: true,
                completion: nil)
    }
}
