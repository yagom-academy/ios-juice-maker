//
//  StockEditView.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

protocol StockEditViewDelegate: AnyObject {
    func dismissStockEditView()
    func updateSingleFruitStock(fruit: Fruit, quantity: Int)
    func updateSingleFruitQuantityLabel(_ view: StockEditView, fruit: Fruit)
}

final class StockEditView: UIView {
    weak var delegate: StockEditViewDelegate?
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.dismissStockEditView()
    }
    
    @IBAction func adjustStrawberryStepper(_ sender: UIStepper) {
        delegate?.updateSingleFruitStock(fruit: .strawberry, quantity: Int(sender.value))
        delegate?.updateSingleFruitQuantityLabel(self, fruit: .strawberry)
    }
    
    @IBAction func adjustBananaStepper(_ sender: UIStepper) {
        delegate?.updateSingleFruitStock(fruit: .banana, quantity: Int(sender.value))
        delegate?.updateSingleFruitQuantityLabel(self, fruit: .banana)
    }
    
    @IBAction func adjustPineappleStepper(_ sender: UIStepper) {
        delegate?.updateSingleFruitStock(fruit: .pineapple, quantity: Int(sender.value))
        delegate?.updateSingleFruitQuantityLabel(self, fruit: .pineapple)
    }
    
    @IBAction func adjustKiwiStepper(_ sender: UIStepper) {
        delegate?.updateSingleFruitStock(fruit: .kiwi, quantity: Int(sender.value))
        delegate?.updateSingleFruitQuantityLabel(self, fruit: .kiwi)
    }
    
    @IBAction func adjustMangoStepper(_ sender: UIStepper) {
        delegate?.updateSingleFruitStock(fruit: .mango, quantity: Int(sender.value))
        delegate?.updateSingleFruitQuantityLabel(self, fruit: .mango)
    }
    
    func updateSingleFruitQuantityLabel(fruit: Fruit, quantity: Int) {
        switch fruit {
        case .strawberry:
            strawberryQuantityLabel.text = String(quantity)
        case .banana:
            bananaQuantityLabel.text = String(quantity)
        case .pineapple:
            pineappleQuantityLabel.text = String(quantity)
        case .kiwi:
            kiwiQuantityLabel.text = String(quantity)
        case .mango:
            mangoQuantityLabel.text = String(quantity)
        }
    }
    
    func updateSingleFruitStepperValue(fruit: Fruit, quantity: Int) {
        switch fruit {
        case .strawberry:
            strawberryStepper.value = Double(quantity)
        case .banana:
            bananaStepper.value = Double(quantity)
        case .pineapple:
            pineappleStepper.value = Double(quantity)
        case .kiwi:
            kiwiStepper.value = Double(quantity)
        case .mango:
            mangoStepper.value = Double(quantity)
        }
    }
}
