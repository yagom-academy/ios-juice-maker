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
        mangoStockLabel.text = mangoStock
        kiwiStockLabel.text = kiwiStock
    }
    
    @IBAction func didTapCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    @IBAction func strawberryStockChangeStepper(_ sender: UIStepper) {
        guard let strawberryStock = Int(strawberryStock) else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock + Int(sender.value))
    }
    
    @IBAction func bananaStockChangeStepper(_ sender: UIStepper) {
        guard let bananaStock = Int(bananaStock) else {
            return
        }
        bananaStockLabel.text = String(bananaStock + Int(sender.value))
    }
    @IBAction func pineappleStockChangeStepper(_ sender: UIStepper) {
        guard let pineappleStock = Int(pineappleStock) else {
            return
        }
        pineappleStockLabel.text = String(pineappleStock + Int(sender.value))
    }
    
    @IBAction func kiwiStockChangeStepper(_ sender: UIStepper) {
        guard let kiwiStock = Int(kiwiStock) else {
            return
        }
        kiwiStockLabel.text = String(kiwiStock + Int(sender.value))
    }
    
    
    @IBAction func mangoStockChangeStepper(_ sender: UIStepper) {
        guard let mangoStock = Int(mangoStock) else {
            return
        }
        mangoStockLabel.text = String(mangoStock + Int(sender.value))
    }
}
