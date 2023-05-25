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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStockLabel()
    }
    
    func configureStockLabel() {
        let fruitInventory = fruitStore.readFruitInventory()
        
        guard let strawberryStock = fruitInventory[.strawberry],
              let bananaStock = fruitInventory[.banana],
              let pineappleStock = fruitInventory[.pineapple],
              let kiwiStock = fruitInventory[.kiwi],
              let mangoStock = fruitInventory[.mango]
        else {
            return
        }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    @IBAction func didTapCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapStockChangeStepper(_ sender: UIStepper) {
        let fruit: Fruit
        let stockLabel: UILabel
        
        switch sender {
        case strawberryStockStepper:
            fruit = .strawberry
            stockLabel = strawberryStockLabel
        case bananaStockStepper:
            fruit = .banana
            stockLabel = bananaStockLabel
        case pineappleStockStepper:
            fruit = .pineapple
            stockLabel = pineappleStockLabel
        case kiwiStockStepper:
            fruit = .kiwi
            stockLabel = kiwiStockLabel
        case mangoStockStepper:
            fruit = .mango
            stockLabel = mangoStockLabel
        default:
            return
        }
        
        let stock: Int = fruitStore.readFruitInventory()[fruit] ?? 0
        let changedStock = stock + Int(sender.value)
        stockLabel.text = String(changedStock)
    }
    
    func changeFruitInventory() {
        guard let strawberryChangedStock = Int(strawberryStockLabel.text ?? ""),
              let bananaChangedStock = Int(bananaStockLabel.text ?? ""),
              let pineappleChangedStock = Int(pineappleStockLabel.text ?? ""),
              let kiwiChangedStock = Int(kiwiStockLabel.text ?? ""),
              let mangoChangedStock = Int(mangoStockLabel.text ?? "")
        else {
            return
        }
        
        changeFruitStock(.strawberry, amount: strawberryChangedStock)
        changeFruitStock(.banana, amount: bananaChangedStock)
        changeFruitStock(.pineapple, amount: pineappleChangedStock)
        changeFruitStock(.kiwi, amount: kiwiChangedStock)
        changeFruitStock(.mango, amount: mangoChangedStock)
    }
    
    func changeFruitStock(_ fruit: Fruit, amount: Int) {
        fruitStore.changeFruitStock(fruit, by: amount)
    }
}
