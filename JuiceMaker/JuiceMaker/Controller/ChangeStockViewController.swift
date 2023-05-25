//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/15.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    
    typealias FruitComponent = (fruit: Fruit, label: UILabel, stepper: UIStepper)
    
    lazy var fruitComponents: [FruitComponent] = [(.strawberry, strawberryStockLabel, strawberryStepper),
                                                  (.banana, bananaStockLabel, bananaStepper),
                                                  (.pineapple, pineappleStockLabel, pineappleStepper),
                                                  (.kiwi, kiwiStockLabel, kiwiStepper),
                                                  (.mango, mangoStockLabel, mangoStepper)]
    
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
        configureFruitStockOnLabel()
    }
    
    private func configureFruitStockOnLabel() {
        let currentFruitStock = FruitStore.shared.currentFruitStock
        
        for fruitComponent in fruitComponents {
            guard let stock = currentFruitStock[fruitComponent.fruit] else { return }
            fruitComponent.label.text = String(stock)
            fruitComponent.stepper.value = Double(stock)
        }
    }
    
    @IBAction func changeStockOnLabel(by sender: UIStepper) {
        guard let fruitComponent = fruitComponents.first(where: {$0.stepper == sender}) else { return }
        fruitComponent.label.text = String(Int(sender.value))
    }
    
    @IBAction func touchUpCloseBarButton(_ sender: UIBarButtonItem) {
        updateChangedFruitStock()
        dismiss(animated: true)
    }
    
    private func updateChangedFruitStock() {
        let currentFruitStock = FruitStore.shared.currentFruitStock
        
        for fruitComponent in fruitComponents {
            guard let stock = currentFruitStock[fruitComponent.fruit],
                  let changedStock = fruitComponent.label.text,
                  let changedStockToInt = Int(changedStock) else { return }
            FruitStore.shared.changeStock(with: fruitComponent.fruit, changedStockToInt - stock)
        }
    }
}
