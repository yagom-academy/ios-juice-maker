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
        
        let fruitstore = FruitStore()
        fruitstore.useFruit(juice: .딸바쥬스)
        print(fruitstore.fruitStock)
    }
}

