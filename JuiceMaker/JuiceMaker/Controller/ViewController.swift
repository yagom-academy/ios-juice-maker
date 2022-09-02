//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruitStore = FruitStore.shared
        self.strawberryStockLabel.text = "\(fruitStore.fruitsStock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(fruitStore.fruitsStock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(fruitStore.fruitsStock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(fruitStore.fruitsStock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(fruitStore.fruitsStock[.mango] ?? 0)"
    }
}

