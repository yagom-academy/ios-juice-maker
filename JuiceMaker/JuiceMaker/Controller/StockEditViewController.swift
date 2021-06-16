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
        strawberryStepper.value = Double(fruitStore.getStockAmount(fruit: .strawberry))
        bananaStepper.value = Double(fruitStore.getStockAmount(fruit: .banana))
        pineappleStepper.value = Double(fruitStore.getStockAmount(fruit: .pineapple))
        kiwiStepper.value = Double(fruitStore.getStockAmount(fruit: .kiwi))
        mangoStepper.value = Double(fruitStore.getStockAmount(fruit: .mango))
    }
    
    private func settingAllLabelText() {
        strawberryStockLabel.text = String(fruitStore.getStockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.getStockAmount(fruit: .banana))
        pineappleStockLabel.text = String(fruitStore.getStockAmount(fruit: .pineapple))
        kiwiStockLabel.text = String(fruitStore.getStockAmount(fruit: .kiwi))
        mangoStockLabel.text = String(fruitStore.getStockAmount(fruit: .mango))
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        strawberryStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .strawberry, count: Int(strawberryStepper.value))
        strawberryStockLabel.text = String(Int(strawberryStepper.value))
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        bananaStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .banana, count: Int(bananaStepper.value))
        bananaStockLabel.text = String(Int(bananaStepper.value))
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        pineappleStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .pineapple, count: Int(pineappleStepper.value))
        pineappleStockLabel.text = String(Int(pineappleStepper.value))
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        kiwiStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .kiwi, count: Int(kiwiStepper.value))
        kiwiStockLabel.text = String(Int(kiwiStepper.value))
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
        mangoStepper.value = Double(sender.value)
        fruitStore.inputStock(fruit: .mango, count: Int(mangoStepper.value))
        mangoStockLabel.text = String(Int(mangoStepper.value))
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
