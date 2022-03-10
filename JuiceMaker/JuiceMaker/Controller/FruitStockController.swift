//
//  FruitStockController.swift
//  JuiceMaker
//
//  Created by 곽우종 on 2022/03/07.
//

import UIKit

class FruitStockController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineAppleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineAppleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    var fruitStore = FruitStore.fruitStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStockToLabel()
        setStepperValue()
    }
    
    @IBAction func stockStepperValueChanged(_ sender: UIStepper) {
        if let targetFruit = Fruit(rawValue: sender.tag) {
            try? fruitStore.changeStock(fruit: targetFruit, amount: Int(sender.value))
        }
        loadStockToLabel()
    }
    
    @IBAction func closingTab(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func loadStockToLabel() {
        strawberryStockLabel.text = String(fruitStore.getStock(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.getStock(fruit: .banana))
        pineAppleStockLabel.text = String(fruitStore.getStock(fruit: .pineapple))
        kiwiStockLabel.text = String(fruitStore.getStock(fruit: .kiwi))
        mangoStockLabel.text = String(fruitStore.getStock(fruit: .mango))
    }
    
    func setStepperValue() {
        strawberryStockStepper.value = Double(fruitStore.getStock(fruit: .strawberry))
        bananaStockStepper.value = Double(fruitStore.getStock(fruit: .banana))
        pineAppleStockStepper.value = Double(fruitStore.getStock(fruit: .pineapple))
        kiwiStockStepper.value = Double(fruitStore.getStock(fruit: .kiwi))
        mangoStockStepper.value = Double(fruitStore.getStock(fruit: .mango))
    }
}
