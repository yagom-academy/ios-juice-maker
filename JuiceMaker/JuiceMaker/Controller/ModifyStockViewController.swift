//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/25.
//

import UIKit

class ModifyStockViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    @IBAction private func stepperValueChanged(_ stepper: UIStepper) {
        guard let (label, fruit) = matchStepperToLabelAndFruit(stepper: stepper) else {
            return
        }
        
        modifiedStock?.updateValue(Int(stepper.value), forKey: fruit)
        updateStockLabel(with: label)
    }
    
    private func matchStepperToLabelAndFruit(stepper: UIStepper) -> (label: UILabel, fruit: FruitStore.Fruit)? {
        switch stepper {
        case strawberryStockStepper:
            return (strawberryStockLabel, .strawberry)
        case bananaStockStepper:
            return (bananaStockLabel, .banana)
        case pineappleStockStepper:
            return (pineappleStockLabel, .pineapple)
        case kiwiStockStepper:
            return (kiwiStockLabel, .kiwi)
        case mangoStockStepper:
            return (mangoStockLabel, .mango)
        default:
            return nil
        }
    }
    
    private func initializeAllStepper() {
        let stockSteppers: [UIStepper]! = [strawberryStockStepper, bananaStockStepper, pineappleStockStepper, kiwiStockStepper, mangoStockStepper]
        
        stockSteppers.forEach { stockStepper in
            initializeStepper(stepper: stockStepper)
        }
    }
    
    private func initializeStepper(stepper: UIStepper) {
        guard let fruit = matchStepperToLabelAndFruit(stepper: stepper)?.fruit else {
            return
        }
        
        guard let currentStockCount = modifiedStock?[fruit] else {
            return
        }
        
        stepper.value = Double(currentStockCount)
        stepper.minimumValue = 0
        stepper.autorepeat = true
    }
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        guard let stock = modifiedStock else {
            return
        }
        
        NotificationCenter.default.post(name: .receiveModifiedStock, object: nil, userInfo: ["modifiedStock": stock])
        self.dismiss(animated: true, completion: nil)
    }
    
    var modifiedStock: [FruitStore.Fruit:Int]?
    
    private func updateAllStockLabels() {
        let stockLabels: [UILabel]! = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        
        stockLabels.forEach { stockLabel in
            updateStockLabel(with: stockLabel)
        }
    }
    
    private func updateStockLabel(with label: UILabel) {
        guard let fruit = matchFruit(with: label) else {
            return
        }
        
        guard let currentStockCount = modifiedStock?[fruit] else {
            return
        }
        
        label.text = String(currentStockCount)
    }
    
    private func matchFruit(with label: UILabel) -> FruitStore.Fruit? {
        switch label {
        case strawberryStockLabel:
            return .strawberry
        case bananaStockLabel:
            return .banana
        case pineappleStockLabel:
            return .pineapple
        case kiwiStockLabel:
            return .kiwi
        case mangoStockLabel:
            return .mango
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAllStepper()
        updateAllStockLabels()
    }
}
