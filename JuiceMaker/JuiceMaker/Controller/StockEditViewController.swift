//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Ellen on 2021/06/11.
//

import UIKit

class StockEditViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.sharedInstance
    
    override func viewDidLoad() {
        strawberryStockLabel.text = String(fruitStore.getStockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.getStockAmount(fruit: .banana))
        pineappleStockLabel.text = String(fruitStore.getStockAmount(fruit: .pineapple))
        kiwiStockLabel.text = String(fruitStore.getStockAmount(fruit: .kiwi))
        mangoStockLabel.text = String(fruitStore.getStockAmount(fruit: .mango))
    }
    
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
