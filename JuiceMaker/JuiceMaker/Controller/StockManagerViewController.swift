//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Harry, kokkilE. 
//

import UIKit

final class StockManagerViewController: UIViewController {

    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    private let fruitStore = FruitStore.shared
    
    private var fruitLabelsDictionary: [Fruit: UILabel] = [:]
    private var fruitSteppersDictionary: [UIStepper: Fruit] = [:]
    
    weak var juiceMakerViewControllerDelegate: UpdateLabelsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defineDictionary()
        configureStepperCurrentValue()
        configureFruitCountLabels()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) {
        updateFruitStrock()
        juiceMakerViewControllerDelegate?.configureFruitCountLabels()
        self.dismiss(animated: true)
    }
    
    @IBAction private func touchUpStepper(_ sender: UIStepper) {
        guard let fruit = fruitSteppersDictionary[sender] else { return }
        
        fruitLabelsDictionary[fruit]?.text = Int(sender.value).description
    }
    
    private func defineDictionary() {
        fruitLabelsDictionary = [
            .strawberry: strawberryCountLabel,
            .banana: bananaCountLabel,
            .kiwi: kiwiCountLabel,
            .pineapple: pineappleCountLabel,
            .mango: mangoCountLabel
        ]
        
        fruitSteppersDictionary = [
            strawberryStepper: .strawberry,
            bananaStepper: .banana,
            kiwiStepper: .kiwi,
            pineappleStepper: .pineapple,
            mangoStepper: .mango
        ]
    }

    private func configureFruitCountLabels() {
        for fruit in Fruit.allCases {
            fruitLabelsDictionary[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
        }
    }
    
    private func configureStepperCurrentValue() {
        for (stepper, fruit) in fruitSteppersDictionary {
            guard let count = fruitStore.getStockCountToString(of: fruit),
                  let stepperValue = Double(count)
            else { return }
            stepper.value = stepperValue
        }
    }
    
    private func updateFruitStrock() {
        for (stepper, fruit) in fruitSteppersDictionary {
            fruitStore.updateFruitStock(fruit: fruit, quantity: Int(stepper.value))
        }
    }
}
