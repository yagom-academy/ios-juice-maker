//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Erick, JusBug on 2023/05/19.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    static let id = "ChangeStockViewControllerID"
    var fruitStore = FruitStore()
    var delegate: ChangeStockDelegate?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        setText()
        setStepperValue()
        setStepperTag()
    }
    
    @IBAction private func tapCloseButton(_ sender: UIBarButtonItem) {
        self.delegate?.changeStock(fruitStore: fruitStore)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func changeStockStepper(_ sender: UIStepper) {
        let amount = Int(sender.value)
        
        switch sender.tag {
        case 0:
            fruitStore.changeStock(amount, to: .strawberry)
        case 1:
            fruitStore.changeStock(amount, to: .banana)
        case 2:
            fruitStore.changeStock(amount, to: .pineapple)
        case 3:
            fruitStore.changeStock(amount, to: .kiwi)
        case 4:
            fruitStore.changeStock(amount, to: .mango)
        default:
            return
        }
        
        setText()
    }
    
    private func setText() {
        strawberryStockLabel.text = String(fruitStore.bringStock(.strawberry))
        bananaStockLabel.text = String(fruitStore.bringStock(.banana))
        pineappleStockLabel.text = String(fruitStore.bringStock(.pineapple))
        kiwiStockLabel.text = String(fruitStore.bringStock(.kiwi))
        mangoStockLabel.text = String(fruitStore.bringStock(.mango))
    }
    
    private func setStepperValue() {
        strawberryStockStepper.value = Double(fruitStore.bringStock(.strawberry))
        bananaStockStepper.value = Double(fruitStore.bringStock(.banana))
        pineappleStockStepper.value = Double(fruitStore.bringStock(.pineapple))
        kiwiStockStepper.value = Double(fruitStore.bringStock(.kiwi))
        mangoStockStepper.value = Double(fruitStore.bringStock(.mango))
    }
    
    private func setStepperTag() {
        strawberryStockStepper.tag = 0
        bananaStockStepper.tag = 1
        pineappleStockStepper.tag = 2
        kiwiStockStepper.tag = 3
        mangoStockStepper.tag = 4
    }
}
