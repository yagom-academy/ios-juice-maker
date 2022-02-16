//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InitialViewController: UIViewController {
    
    var fruitStore = FruitStore(manager: FruitStockManager(stocks: [
        .strawberry:10,
        .banana:10,
        .mango:10,
        .pineapple:10,
        .kiwi:10])
    )
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
        // Do any additional setup after loading the view.
    }
    
    private func updateFruitLabel() {
        strawberryStockLabel.text = "\(fruitStore.checkCount(stock: .strawberry))"
        bananaStockLabel.text = "\(fruitStore.checkCount(stock: .banana))"
        pineappleStockLabel.text = "\(fruitStore.checkCount(stock: .pineapple))"
        kiwiStockLabel.text = "\(fruitStore.checkCount(stock: .kiwi))"
        mangoStockLabel.text = "\(fruitStore.checkCount(stock: .mango))"
    }
    
}

