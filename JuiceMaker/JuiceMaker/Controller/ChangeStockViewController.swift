//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by 표현수 on 2023/05/19.
//

import UIKit

class ChangeStockViewController: UIViewController {
    var fruitStore = FruitStore()
    
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
        
        composeText()
        setStepperValue()
    }
    
    @IBAction private func closeButtonTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func changeStockStepper(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            strawberryStockLabel.text = Int(sender.value).description
        case 1:
            bananaStockLabel.text = Int(sender.value).description
        case 2:
            pineappleStockLabel.text = Int(sender.value).description
        case 3:
            kiwiStockLabel.text = Int(sender.value).description
        case 4:
            mangoStockLabel.text = Int(sender.value).description
        default:
            break
        }
    }
    
    private func composeText() {
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
}
