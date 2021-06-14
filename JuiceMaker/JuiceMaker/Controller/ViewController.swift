//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changedStockButton(_ sender: Any) {
        guard let presentModal = storyboard?.instantiateViewController(identifier: "stockChange") else { return }
        present(presentModal, animated: true, completion: nil)
    }
    
}

