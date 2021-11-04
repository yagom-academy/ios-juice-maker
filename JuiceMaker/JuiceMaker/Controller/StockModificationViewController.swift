//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by 양호준 on 2021/10/28.
//

import UIKit

class StockModificationViewController: UIViewController {
    
    let fruitStore = FruitStore()
    
    
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private func updateFruitStockLabel() {
        guard let strawberryStock = fruitStore.stock[Fruit.strawberry],
              let bananaStock = fruitStore.stock[Fruit.banana],
              let pineappleStock = fruitStore.stock[Fruit.pineapple],
              let kiwiStock = fruitStore.stock[Fruit.kiwi],
              let mangoStock = fruitStore.stock[Fruit.mango] else {
                  return
              }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateFruitStockLabel()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) { 
        dismiss(animated: true, completion: nil)
    }
}
