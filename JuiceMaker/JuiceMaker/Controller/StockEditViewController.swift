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
        let stockAmountToChange: Int = Int(stockStepper.value) - currentStock
        delegate?.fruitStore.changeStock(of: fruit, by: stockAmountToChange)
        return currentStock + stockAmountToChange
    }
    
    private func updateFruitStock() {
        if let strawberryStock = try? delegate?.fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
            strawberryStockStepper.value = Double(strawberryStock)
        } else {
            strawberryStockLabel.text = FruitStoreError.notExist
            strawberryStockStepper.isEnabled = false
        }
        if let bananaStock = try? delegate?.fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
            bananaStockStepper.value = Double(bananaStock)
        } else {
            bananaStockLabel.text = FruitStoreError.notExist
            bananaStockStepper.isEnabled = false
        }
        if let kiwiStock = try? delegate?.fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
            kiwiStockStepper.value = Double(kiwiStock)
        } else {
            kiwiStockLabel.text = FruitStoreError.notExist
            kiwiStockStepper.isEnabled = false
        }
        if let pineappleStock = try? delegate?.fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
            pineappleStockStepper.value = Double(pineappleStock)
        } else {
            pineappleStockLabel.text = FruitStoreError.notExist
            pineappleStockStepper.isEnabled = false
        }
        if let mangoStock = try? delegate?.fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
            mangoStockStepper.value = Double(mangoStock)
        } else {
            mangoStockLabel.text = FruitStoreError.notExist
            mangoStockStepper.isEnabled = false
        }
    }
}
