//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let juiceMaker: JuiceMaker = JuiceMaker()
        juiceMaker.fruitStore.addStock(fruit: .strawberry, amount: 100)
        juiceMaker.makeJuice(juice: .strawberryBananaJuice)
        
        
    }


}

