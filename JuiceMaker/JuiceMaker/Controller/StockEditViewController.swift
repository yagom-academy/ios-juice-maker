//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

import UIKit

class StockEditViewController: UIViewController {
    
    weak var delegate: FruitStoreDelegate?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStock()
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func touchUpStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStockStepper:
            if let changedStock = changeStock(of: .strawberry, by: sender) {
                strawberryStockLabel.text = "\(changedStock)"
            }
        case bananaStockStepper:
            if let changedStock = changeStock(of: .banana, by: sender) {
                bananaStockLabel.text = "\(changedStock)"
            }
        case kiwiStockStepper:
            if let changedStock = changeStock(of: .kiwi, by: sender) {
                kiwiStockLabel.text = "\(changedStock)"
            }
        case pineappleStockStepper:
            if let changedStock = changeStock(of: .pineapple, by: sender) {
                pineappleStockLabel.text = "\(changedStock)"
            }
        case mangoStockStepper:
            if let changedStock = changeStock(of: .mango, by: sender) {
                mangoStockLabel.text = "\(changedStock)"
            }
        default:
            return
        }
    }
    
    private func changeStock(of fruit: Fruit, by stockStepper: UIStepper) -> Int? {
        guard let currentStock = try? delegate?.fruitStore.currentStock(of: fruit) else {
            return nil
        }
        let stockStepperValue: Int = Int(stockStepper.value)
        let stockAmountToChange: Int = stockStepperValue - currentStock
        delegate?.fruitStore.changeStock(of: fruit, by: stockAmountToChange)
        return currentStock + stockAmountToChange
    }
    
    private func updateFruitStock() {
        for fruit in Fruit.allCases {
            let fruitStock: Int? = try? delegate?.fruitStore.currentStock(of: fruit)
            updateFruitStockLabel(of: fruit, to: fruitStock)
            updateFruitStockStepper(of: fruit, to: fruitStock)
        }
    }
    
    private func updateFruitStockLabel(of fruit: Fruit, to fruitStock: Int?) {
        guard let label = self.view.viewWithTag(fruit.rawValue) as? UILabel else {
            return
        }
        if let stock = fruitStock {
            label.text = "\(stock)"
        } else {
            label.text = FruitStoreError.notExist
        }
    }
    
    private func updateFruitStockStepper(of fruit: Fruit, to fruitStock: Int?) {
        guard let stepper = self.view.viewWithTag(-fruit.rawValue) as? UIStepper  else {
            return
        }
        if let stock = fruitStock {
            stepper.value = Double(stock)
        } else {
            stepper.isEnabled = false
        }
    }
}
