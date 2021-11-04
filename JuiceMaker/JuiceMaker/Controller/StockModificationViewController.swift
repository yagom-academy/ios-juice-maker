//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by 양호준 on 2021/10/28.
//

import UIKit

class StockModificationViewController: UIViewController {
    let fruitStore = FruitStore()
    
    var strawberryStock = ""
    var bananaStock = ""
    var pineappleStock = ""
    var kiwiStock = ""
    var mangoStock = ""
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    func updateStock() {
        strawberryStockLabel.text = strawberryStock
        bananaStockLabel.text = bananaStock
        pineappleStockLabel.text = pineappleStock
        kiwiStockLabel.text = kiwiStock
        mangoStockLabel.text = mangoStock
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStock()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) { 
        dismiss(animated: true, completion: nil)
    }
}
