//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var a = FruitStore()
        a.changeAmountOfFruits(fruit: "banana", amount: 50)
        
        var b = JuiceMaker()
        b.makeFruitJuice(fruit: "banana")
    }


}

