//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

import UIKit

class StockEditViewController: UIViewController {
    
    weak var delegate: FruitStoreDelegate?
    var amountOfStrawberryStockToChange: Int = 0
    var amountOfBananaStockToChange: Int = 0
    var amountOfKiwiStockToChange: Int = 0
    var amountOfPineappleStockToChange: Int = 0
    var amountOfMangoStockToChange: Int = 0
    
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
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        switch sender {
        case straberryStockStepper:
            amountOfStrawberryStockToChange = Int(sender.value)
            guard let currentStock = try? delegate?.fruitStore.currentStock(of: .strawberry) else {
                return
            }
            guard currentStock + amountOfStrawberryStockToChange >= 0 else {
                amountOfStrawberryStockToChange += 1
                return
            }
            strawberryStockLabel.text = "\(currentStock + amountOfStrawberryStockToChange)"
        case bananaStockStepper:
            amountOfBananaStockToChange = Int(sender.value)
            guard let currentStock = try? delegate?.fruitStore.currentStock(of: .banana) else {
                return
            }
            guard currentStock + amountOfBananaStockToChange >= 0 else {
                amountOfBananaStockToChange += 1
                return
            }
            bananaStockLabel.text = "\(currentStock + amountOfBananaStockToChange)"
        case kiwiStockStepper:
            amountOfKiwiStockToChange = Int(sender.value)
            guard let currentStock = try? delegate?.fruitStore.currentStock(of: .kiwi) else {
                return
            }
            guard currentStock + amountOfKiwiStockToChange >= 0 else {
                amountOfKiwiStockToChange += 1
                return
            }
            kiwiStockLabel.text = "\(currentStock + amountOfKiwiStockToChange)"
        case pineappleStockStepper:
            amountOfPineappleStockToChange = Int(sender.value)
            guard let currentStock = try? delegate?.fruitStore.currentStock(of: .pineapple) else {
                return
            }
            guard currentStock + amountOfPineappleStockToChange >= 0 else {
                amountOfPineappleStockToChange += 1
                return
            }
            pineappleStockLabel.text = "\(currentStock + amountOfPineappleStockToChange)"
        case mangoStockStepper:
            amountOfMangoStockToChange = Int(sender.value)
            guard let currentStock = try? delegate?.fruitStore.currentStock(of: .mango) else {
                return
            }
            guard currentStock + amountOfMangoStockToChange >= 0 else {
                amountOfMangoStockToChange += 1 
                return
            }
            mangoStockLabel.text = "\(currentStock + amountOfMangoStockToChange)"
        default:
            return
        }
    }
    
    func updateFruitStockLabel() {
        if let strawberryStock = try? delegate?.fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
        } else {
            strawberryStockLabel.text = FruitStoreError.notExist
        }
        if let bananaStock = try? delegate?.fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
        } else {
            bananaStockLabel.text = FruitStoreError.notExist
        }
        if let kiwiStock = try? delegate?.fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
        } else {
            kiwiStockLabel.text = FruitStoreError.notExist
        }
        if let pineappleStock = try? delegate?.fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
        } else {
            pineappleStockLabel.text = FruitStoreError.notExist
        }
        if let mangoStock = try? delegate?.fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
        } else {
            mangoStockLabel.text = FruitStoreError.notExist
        }
    }
}
