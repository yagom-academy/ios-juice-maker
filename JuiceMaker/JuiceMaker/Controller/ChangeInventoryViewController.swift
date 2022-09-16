//
//  ChangeInventoryViewController.swift
//  JuiceMaker
//
//  Created by Mene, Dragon on 2022/09/02.
//

import UIKit

class ChangeInventoryViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBAction private func closeButton(_ sender: UIButton) {
        dismiss(animated: true,
                completion: nil)
    }
    
    @IBAction private func setFruitStock(_ sender: UIStepper) {
        switch sender.tag {
        case 1:
            strawberryStockLabel.text = Int(sender.value).description
            juiceMaker.store.inventory[.strawberry] = Int(sender.value)
        case 2:
            bananaStockLabel.text = Int(sender.value).description
            juiceMaker.store.inventory[.banana] = Int(sender.value)
        case 3:
            pineappleStockLabel.text = Int(sender.value).description
            juiceMaker.store.inventory[.pineapple] = Int(sender.value)
        case 4:
            kiwiStockLabel.text = Int(sender.value).description
            juiceMaker.store.inventory[.kiwi] = Int(sender.value)
        case 5:
            mangoStockLabel.text = Int(sender.value).description
            juiceMaker.store.inventory[.mango] = Int(sender.value)
        default:
            break
        }
    }
    
    private func setFruitStepper(number stepper: Int) -> [UIStepper] {
        var fruitStepperArray: [UIStepper] = []
        
        for tagNumber in 1...stepper {
            guard let fruitStepper = self.view.viewWithTag(tagNumber) as? UIStepper
            else { break }
            fruitStepperArray.append(fruitStepper)
        }
        
        return fruitStepperArray
    }
    
    private func checkStepperValue() {
        var fruitStepper: [UIStepper] = setFruitStepper(number: 5)
        
        for fruit in Fruit.allCases {
            let stepper = fruitStepper.removeFirst()
            stepper.value = Double(juiceMaker.store.inventory[fruit] ?? 0)
        }
    }
    
    private func checkInventory() {
        strawberryStockLabel.text = juiceMaker.checkStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.checkStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.checkStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.checkStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.checkStock(of: .mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInventory()
        checkStepperValue()
    }
}
