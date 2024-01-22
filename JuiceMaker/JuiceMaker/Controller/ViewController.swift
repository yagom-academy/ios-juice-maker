//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruits: [Fruit: Int] = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
        
        var fruitStore = FruitStore(fruits: fruits)
        var juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
}

