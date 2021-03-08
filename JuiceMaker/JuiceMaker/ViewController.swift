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
        
        let j = JuiceMaker()
        print(j.fruitStocks)
        
        j.consumeFriut(fruit: .banana, stock: 12)
        
        print(j.fruitStocks)
        
    }
}

