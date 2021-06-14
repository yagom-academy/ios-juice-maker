//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialStock(of: .strawberry, label: strawberryStock)
        setInitialStock(of: .banana, label: bananaStock)
        setInitialStock(of: .pineapple, label: pineappleStock)
        setInitialStock(of: .kiwi, label: kiwiStock)
        setInitialStock(of: .mango, label: mangoStock)
    }
    
    func setInitialStock(of fruit: Fruit, label: UILabel) {
        guard let initialStock = try? fruitStore.showStockLeft(fruit: fruit) else {
            return
        }
        label.text = String(initialStock)
    }
}

