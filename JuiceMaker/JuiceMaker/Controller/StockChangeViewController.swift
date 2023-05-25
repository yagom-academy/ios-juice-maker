//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/24.
//

import UIKit

class StockChangeViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    var fruitStore: FruitStore = FruitStore()
    
    var strawberryStock: String = ""
    var bananaStock: String = ""
    var pineappleStock: String = ""
    var kiwiStock: String = ""
    var mangoStock: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStockLabel.text = strawberryStock
        bananaStockLabel.text = bananaStock
        pineappleStockLabel.text = pineappleStock
        kiwiStockLabel.text = kiwiStock
        mangoStockLabel.text = mangoStock
    }
    
    @IBAction func didTapCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    @IBAction func didTapStockChangeStepper(_ sender: UIStepper) {
        let stock: String
        let stockLabel: UILabel
        
        switch sender {
        case strawberryStockStepper:
            stock = strawberryStock
            stockLabel = strawberryStockLabel
        case bananaStockStepper:
            stock = bananaStock
            stockLabel = bananaStockLabel
        case pineappleStockStepper:
            stock = pineappleStock
            stockLabel = pineappleStockLabel
        case kiwiStockStepper:
            stock = kiwiStock
            stockLabel = kiwiStockLabel
        case mangoStockStepper:
            stock = mangoStock
            stockLabel = mangoStockLabel
        default:
            return
        }
        
        guard let stock = Int(stock) else {
            return
        }
        stockLabel.text = String(stock + Int(sender.value))
    }
}
