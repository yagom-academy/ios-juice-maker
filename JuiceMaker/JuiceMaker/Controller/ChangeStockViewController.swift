//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/15.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    
    @IBOutlet weak var strawBerryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawBerryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockOnLabel()
        changeFruitStockStepper()
    }
    
    private func showFruitStockOnLabel() {
        
        let fruitAndLabel: [Fruit : UILabel] = [
            .strawBerry: strawBerryStockLabel,
            .banana: bananaStockLabel,
            .pineApple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, label) in fruitAndLabel {
            guard let stock = FruitStore.shared.currentFruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    private func changeFruitStockStepper() {
        let fruitAndStepper: [Fruit : UIStepper] = [
            .strawBerry: strawBerryStepper,
            .banana: bananaStepper,
            .pineApple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        
        for (fruit, stepper) in fruitAndStepper {
            guard let stock = FruitStore.shared.currentFruitStock[fruit] else { return }
            stepper.value = Double(stock)
        }
    }
    
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
        let stepperAndLabel: [UIStepper: UILabel] = [
            strawBerryStepper: strawBerryStockLabel,
            bananaStepper: bananaStockLabel,
            pineappleStepper: pineappleStockLabel,
            kiwiStepper: kiwiStockLabel,
            mangoStepper: mangoStockLabel
        ]
        
        if let label = stepperAndLabel[sender] {
            label.text = Int(sender.value).description
        }
    }
    
    @IBAction func changeConfirm(_ sender: Any) {
        let fruitLabels: [Fruit: UILabel] = [
            .strawBerry: strawBerryStockLabel,
            .banana: bananaStockLabel,
            .pineApple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, label) in fruitLabels {
            guard let stock = FruitStore.shared.currentFruitStock[fruit] else { return }
            guard let text = label.text, let intText = Int(text) else { return }
            FruitStore.shared.changeStock(with: fruit, intText - stock)
        }
        
        self.dismiss(animated: true)
    }
}

