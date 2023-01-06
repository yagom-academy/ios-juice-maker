//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockValue: UILabel!
    @IBOutlet weak var bananaStockValue: UILabel!
    @IBOutlet weak var pineappleStockValue: UILabel!
    @IBOutlet weak var kiwiStockValue: UILabel!
    @IBOutlet weak var mangoStockValue: UILabel!
    
    lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryStockValue,
        .banana: bananaStockValue,
        .pineapple: pineappleStockValue,
        .kiwi: kiwiStockValue,
        .mango: mangoStockValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (fruit, value) in fruitStockValue {
            value.text = String(juiceMaker.fruitStore.checkStockValue(fruit: fruit))
        }
    }
}

