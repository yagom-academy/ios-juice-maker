//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/15.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    
    lazy var fruitAndLabel: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockOnLabel()
        updateFruitStockOnStepper()
    }
    
    private func updateFruitStockOnLabel() {
        let currentFruitStock = FruitStore.shared.currentFruitStock
        
        for (fruit, label) in fruitAndLabel {
            guard let stock = currentFruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    private func updateFruitStockOnStepper() {
        let fruitAndStepper: [Fruit: UIStepper] = [
            .strawberry: strawberryStepper,
            .banana: bananaStepper,
            .pineapple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        
        let currentFruitStock = FruitStore.shared.currentFruitStock
        
        for (fruit, stepper) in fruitAndStepper {
            guard let stock = currentFruitStock[fruit] else { return }
            stepper.value = Double(stock)
        }
    }
    
    @IBAction func changeStockOnLabel(by sender: UIStepper) {
        let stepperAndLabel: [UIStepper: UILabel] = [
            strawberryStepper: strawberryStockLabel,
            bananaStepper: bananaStockLabel,
            pineappleStepper: pineappleStockLabel,
            kiwiStepper: kiwiStockLabel,
            mangoStepper: mangoStockLabel
        ]
        
        if let label = stepperAndLabel[sender] {
            label.text = String(Int(sender.value))
        }
    }
    
    @IBAction func closeViewBarButton(_ sender: UIBarButtonItem) {
        changedFruitStock()
        dismiss(animated: true)
    }
    
    private func changedFruitStock() {
        let currentFruitStock = FruitStore.shared.currentFruitStock
        
        for (fruit, label) in fruitAndLabel {
            guard let stock = currentFruitStock[fruit] else { return }
            guard let changedStock = label.text, let changedStock = Int(changedStock) else { return }
            FruitStore.shared.changeStock(with: fruit, changedStock - stock)
        }
    }
}

