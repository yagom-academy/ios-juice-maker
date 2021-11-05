//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by 양호준 on 2021/10/28.
//

import UIKit

class StockModificationViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
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
    
    private func updateStock() {
        strawberryStockLabel.text = strawberryStock
        bananaStockLabel.text = bananaStock
        pineappleStockLabel.text = pineappleStock
        kiwiStockLabel.text = kiwiStock
        mangoStockLabel.text = mangoStock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateStock()
        updateStepperValue()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) { 
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func touchUpStrawberryStepper(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .strawberry, by: sender)
        notificationCenter.post(name: .stockDataTransmission, object: strawberryStepper.value)
    }
    
    @IBAction private func touchUpBananaStepper(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .banana, by: sender)
        notificationCenter.post(name: .stockDataTransmission, object: bananaStepper.value)
    }
    
    @IBAction private func touchUpPineappleStepper(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .pineapple, by: sender)
        notificationCenter.post(name: .stockDataTransmission, object: pineappleStepper.value)
    }
    
    @IBAction private func touchUpKiwiStepper(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .kiwi, by: sender)
        notificationCenter.post(name: .stockDataTransmission, object: kiwiStepper.value)
    }
    
    @IBAction private func touchUpMangoStepper(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
        fruitStore.modifyStock(from: .mango, by: sender)
        notificationCenter.post(name: .stockDataTransmission, object: mangoStepper.value)
    }
    
    private func updateStepperValue() {
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
