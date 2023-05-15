//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel] = []
    let juiceMaker = JuiceMaker(fruitStore: FruitStore(fruitInventory: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabels()
    }
    
    private func updateFruitStockLabels() {
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            guard let fruitCount = juiceMaker.fruitStore.getCurrentStock(of: fruit) else { return }
            fruitStockLabel.text = "\(fruitCount)"
        }
    }
}

