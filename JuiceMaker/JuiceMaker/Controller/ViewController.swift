//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let juicemaker1: JuiceMaker = JuiceMaker()
        for _ in 1...10 {
            juicemaker1.make(.bananaJuice)
        }
    }


}

