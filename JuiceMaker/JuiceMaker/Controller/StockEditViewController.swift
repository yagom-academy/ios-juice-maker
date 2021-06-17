//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Ellen on 2021/06/11.
//

import UIKit

class StockEditViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
        
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingAllLabelText()
        strawberryStepper.value = Double(fruitStore.stockAmount(fruit: .strawberry))
        bananaStepper.value = Double(fruitStore.stockAmount(fruit: .banana))
        pineappleStepper.value = Double(fruitStore.stockAmount(fruit: .pineapple))
        kiwiStepper.value = Double(fruitStore.stockAmount(fruit: .kiwi))
        mangoStepper.value = Double(fruitStore.stockAmount(fruit: .mango))
    }
    
    private func settingAllLabelText() {
        strawberryStockLabel.text = String(fruitStore.stockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.stockAmount(fruit: .banana))
        pineappleStockLabel.text = String(fruitStore.stockAmount(fruit: .pineapple))
        kiwiStockLabel.text = String(fruitStore.stockAmount(fruit: .kiwi))
        mangoStockLabel.text = String(fruitStore.stockAmount(fruit: .mango))
    }
    
    @IBAction func strawberryStepperDidTap(_ sender: UIStepper) {
        strawberryStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .strawberry, count: Int(strawberryStepper.value))
        strawberryStockLabel.text = String(Int(strawberryStepper.value))
    }
    
    @IBAction func bananaStepperDidTap(_ sender: UIStepper) {
        bananaStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .banana, count: Int(bananaStepper.value))
        bananaStockLabel.text = String(Int(bananaStepper.value))
    }
    
    @IBAction func pineappleStepperDidTap(_ sender: UIStepper) {
        pineappleStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .pineapple, count: Int(pineappleStepper.value))
        pineappleStockLabel.text = String(Int(pineappleStepper.value))
    }
    
    @IBAction func kiwiStepperDidTap(_ sender: UIStepper) {
        kiwiStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .kiwi, count: Int(kiwiStepper.value))
        kiwiStockLabel.text = String(Int(kiwiStepper.value))
    }
    
    @IBAction func mangoStepperDidTap(_ sender: UIStepper) {
        mangoStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .mango, count: Int(mangoStepper.value))
        mangoStockLabel.text = String(Int(mangoStepper.value))
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
