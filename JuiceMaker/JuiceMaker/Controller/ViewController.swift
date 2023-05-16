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
        // Do any additional setup after loading the view.

        updateFruitStockLabel()
        
    }
    
    func updateFruitStockLabel() {
        let juiceMaker = JuiceMaker()
        juiceMaker.blendFruitJuice(menu: .bananaJuice)
        juiceMaker.blendFruitJuice(menu: .strawberryJuice)
        strawberryStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[0])
        bananaStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[1])
        pineappleStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[2])
        kiwiStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[3])
        mangoStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[4])
    }
}

