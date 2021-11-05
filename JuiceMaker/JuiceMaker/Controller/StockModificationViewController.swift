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
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
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
        updateStepperValue()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) { 
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpStrawberryStepper(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .strawberry, by: sender)
    }
    
    @IBAction func touchUpBananaStepper(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .banana, by: sender)
    }
    
    @IBAction func touchUpPineappleStepper(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .pineapple, by: sender)
    }
    
    @IBAction func touchUpKiwiStepper(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .kiwi, by: sender)
    }
    
    @IBAction func touchUpMangoStepper(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .mango, by: sender)
    }
    
    func updateStepperValue() {
        guard let strawberryAmount = Double(strawberryStockLabel.text ?? "0.0"),
              let bananaAmount = Double(bananaStockLabel.text ?? "0.0"),
              let pineappleAmount = Double(pineappleStockLabel.text ?? "0.0"),
              let kiwiAmount = Double(kiwiStockLabel.text ?? "0.0"),
              let mangoAmount = Double(mangoStockLabel.text ?? "0.0") else {
                  return
              }
        
        strawberryStepper.value = strawberryAmount
        bananaStepper.value = bananaAmount
        pineappleStepper.value = pineappleAmount
        kiwiStepper.value = kiwiAmount
        mangoStepper.value = mangoAmount
    }
}
