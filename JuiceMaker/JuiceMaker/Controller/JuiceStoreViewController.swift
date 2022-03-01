//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockCountLabel()
    }
    
    func updateFruitStockCountLabel() {
        strawberryCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .pineapple)
        kiwiCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
}

