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
        let juiceMachine: JuiceMaker = JuiceMaker(numberOfStocks: 15)
        print(juiceMachine.fruitStocks)
        
        juiceMachine.makeFruitJuice(.strawberryBanana)
        print(juiceMachine.fruitStocks)
        
        juiceMachine.addStock(fruit: .strawberry)
        print(juiceMachine.fruitStocks)
        
        print(juiceMachine.checkStockAvailable(fruit: .strawberry, requestedStock: 10))
        
    }
}

