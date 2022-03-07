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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
        setStepperValue()
    }
    
    @IBAction func stockStepperValueChanged(_ sender: UIStepper) {
        if let targetFruit = Fruit(rawValue: sender.tag) {
            try? JuiceMaker.juiceMaker.getFruitStore().fixStock(fruit: targetFruit, amount: Int(sender.value))
        }
        updateStock()
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func updateStock() {
        strawberryStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .strawberry))
        bananaStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .banana))
        pineAppleStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .pineapple))
        kiwiStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .kiwi))
        mangoStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .mango))
    }
    
    func setStepperValue() {
        strawberryStockStepper.value = Double(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .strawberry))
        bananaStockStepper.value = Double(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .banana))
        pineAppleStockStepper.value = Double(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .pineapple))
        kiwiStockStepper.value = Double(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .kiwi))
        mangoStockStepper.value = Double(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .mango))
    }
}
