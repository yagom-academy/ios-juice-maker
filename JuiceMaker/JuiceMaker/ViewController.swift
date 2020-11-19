//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "재료가 모자라요", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { (action) in
            
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}

