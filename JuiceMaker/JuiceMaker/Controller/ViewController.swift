//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore()
        fruitStore.subtractionStock(fruit: .strawberry, amount: 5)
        print(fruitStore.stockList)
    }


}

