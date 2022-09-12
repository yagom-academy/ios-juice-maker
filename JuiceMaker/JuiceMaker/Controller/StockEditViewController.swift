//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by jin on 9/6/22.
//

import UIKit

protocol StockEditDelegate {
    func didEndStockEditing(fruitStock: [Fruit: Int])
}

class StockEditViewController: UIViewController {
    
    var delegate: StockEditDelegate?
    private var fruitStock = [Fruit: Int]()
    
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
        
        setStockLabelAndStepperValue()
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }

    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.didEndStockEditing(fruitStock: fruitStock)
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepperPressed(_ sender: UIStepper) {
        fruitStock[.strawberry] = Int(sender.value)
        strawberryStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func bananaStepperPressed(_ sender: UIStepper) {
        fruitStock[.banana] = Int(sender.value)
        bananaStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func pineappleStepperPressed(_ sender: UIStepper) {
        fruitStock[.pineapple] = Int(sender.value)
        pineappleStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func kiwiStepperPressed(_ sender: UIStepper) {
        fruitStock[.kiwi] = Int(sender.value)
        kiwiStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func mangoStepperPressed(_ sender: UIStepper) {
        fruitStock[.mango] = Int(sender.value)
        mangoStockLabel.text = Int(sender.value).description
    }
    
    private func setStockLabelAndStepperValue() {
        fruitStock.forEach({ fruit in
            switch fruit.key {
            case .strawberry:
                strawberryStepper.value = Double(fruit.value)
                strawberryStockLabel.text = String(fruit.value)
            case .banana:
                bananaStepper.value = Double(fruit.value)
                bananaStockLabel.text = String(fruit.value)
            case .pineapple:
                pineappleStepper.value = Double(fruit.value)
                pineappleStockLabel.text = String(fruit.value)
            case .kiwi:
                kiwiStepper.value = Double(fruit.value)
                kiwiStockLabel.text = String(fruit.value)
            case .mango:
                mangoStepper.value = Double(fruit.value)
                mangoStockLabel.text = String(fruit.value)
            }
        })
    }
}
