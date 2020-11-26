//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
        juiceMaker.fruitStock.checkFruitStock()
        juiceMaker.makeJuice(menu: .strawberryJuice)
        juiceMaker.makeJuice(menu: .strawberryAndBananaJuice)
        juiceMaker.fruitStock.checkFruitStock()
        juiceMaker.fruitStock.subtractOneStock(from: .strawberry)
    }
}
