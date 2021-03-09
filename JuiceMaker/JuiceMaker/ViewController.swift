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
        Fruits.strawberry.addStock(10)
        Fruits.kiwi.addStock(10)
        print(Fruits.kiwi.stock)
    }


}

