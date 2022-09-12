//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

import UIKit

class StockEditViewController: UIViewController {
    
    weak var delegate: FruitStoreDelegate?
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var straberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStock()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        switch sender {
        case straberryStockStepper:
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
    
    func changeStock(of fruit: Fruit, by stockStepper: UIStepper) -> Int? {
        guard let currentStock = try? delegate?.fruitStore.currentStock(of: fruit) else {
            return nil
        }
        let stockAmountToChange: Int = Int(stockStepper.value) - currentStock
        delegate?.fruitStore.changeStock(of: fruit, by: stockAmountToChange)
        return currentStock + stockAmountToChange
    }
    
    func updateFruitStock() {
        if let strawberryStock = try? delegate?.fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
            straberryStockStepper.value = Double(strawberryStock)
        } else {
            strawberryStockLabel.text = FruitStoreError.notExist
        }
        if let bananaStock = try? delegate?.fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
            bananaStockStepper.value = Double(bananaStock)
        } else {
            bananaStockLabel.text = FruitStoreError.notExist
        }
        if let kiwiStock = try? delegate?.fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
            kiwiStockStepper.value = Double(kiwiStock)
        } else {
            kiwiStockLabel.text = FruitStoreError.notExist
        }
        if let pineappleStock = try? delegate?.fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
            pineappleStockStepper.value = Double(pineappleStock)
        } else {
            pineappleStockLabel.text = FruitStoreError.notExist
        }
        if let mangoStock = try? delegate?.fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
            mangoStockStepper.value = Double(mangoStock)
        } else {
            mangoStockLabel.text = FruitStoreError.notExist
        }
    }
}
