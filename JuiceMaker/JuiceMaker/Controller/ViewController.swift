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
        
        let fruitStore = FruitStore()
        debugPrint(fruitStore.fruitStock)
        fruitStore.updateFruitStock(fruit: .strawberry, oper: "+")
        debugPrint(fruitStore.fruitStock)
    }


}

