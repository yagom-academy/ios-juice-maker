//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/24.
//

import UIKit

class StockChangeViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var closeButton: UIBarButtonItem!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    weak var delegate: Exchangeable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
    }
    
    func configureComponents() {
        guard let fruitCurrentInventory = delegate?.takeCurrentInventory() else {
            return
        }
        
        configureStockLabel(fruitCurrentInventory)
        configureStepper(fruitCurrentInventory)
    }
    
    func configureStockLabel(_ fruitCurrentInventory: [Fruit: Int]) {
        strawberryStockLabel.text = String(fruitCurrentInventory[.strawberry] ?? -1)
        bananaStockLabel.text = String(fruitCurrentInventory[.banana] ?? -1)
        pineappleStockLabel.text = String(fruitCurrentInventory[.pineapple] ?? -1)
        kiwiStockLabel.text = String(fruitCurrentInventory[.kiwi] ?? -1)
        mangoStockLabel.text = String(fruitCurrentInventory[.mango] ?? -1)
    }
    
    func configureStepper(_ fruitCurrentInventory: [Fruit: Int]) {
        strawberryStockStepper.value = Double(fruitCurrentInventory[.strawberry] ?? -1)
        bananaStockStepper.value = Double(fruitCurrentInventory[.banana] ?? -1)
        pineappleStockStepper.value = Double(fruitCurrentInventory[.pineapple] ?? -1)
        kiwiStockStepper.value = Double(fruitCurrentInventory[.kiwi] ?? -1)
        mangoStockStepper.value = Double(fruitCurrentInventory[.mango] ?? -1)
    }
    
    @IBAction func didTapStockChangeStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStockStepper:
            strawberryStockLabel.text = String(Int(sender.value))
        case bananaStockStepper:
            bananaStockLabel.text = String(Int(sender.value))
        case pineappleStockStepper:
            pineappleStockLabel.text = String(Int(sender.value))
        case kiwiStockStepper:
            kiwiStockLabel.text = String(Int(sender.value))
        case mangoStockStepper:
            mangoStockLabel.text = String(Int(sender.value))
        default:
            return
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: UIBarButtonItem) {
        let strawberryChangedStock = changeToInt(strawberryStockLabel.text)
        let bananaChangedStock = changeToInt(bananaStockLabel.text)
        let pineappleChangedStock = changeToInt(pineappleStockLabel.text)
        let kiwiChangedStock = changeToInt(kiwiStockLabel.text)
        let mangoChangedStock = changeToInt(mangoStockLabel.text)
        
        let fruitInventory: [Fruit: Int] = [.strawberry: strawberryChangedStock,
                                            .banana: bananaChangedStock,
                                            .pineapple: pineappleChangedStock,
                                            .kiwi: kiwiChangedStock,
                                            .mango: mangoChangedStock]
        
        delegate?.exchangeInventory(inventory: fruitInventory)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func changeToInt(_ text: String?) -> Int {
        guard let text = text, let convertedNumber = Int(text) else {
            return -1
        }
        
        return convertedNumber
    }
    
    func changeToDouble(_ text: String?) -> Double {
        guard let text = text, let convertedNumber = Double(text) else {
            return -1
        }
        
        return convertedNumber
    }
}
