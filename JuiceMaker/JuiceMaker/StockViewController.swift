//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 임리나 on 2020/11/23.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet var stockLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel(fruit: .strawberry)
        updateFruitStockLabel(fruit: .banana)
        updateFruitStockLabel(fruit: .mango)
        updateFruitStockLabel(fruit: .kiwi)
        updateFruitStockLabel(fruit: .pineapple)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        applyFruitStockModification()
    }
    
    @IBAction func touchUpDismissPageButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        guard let stepper = sender as? UIStepper else {
            return showMachineErrorAlert()
        }
        
        let tag = stepper.tag
        guard let fruit = Fruit.Name(rawValue: tag) else {
            return showMachineErrorAlert()
        }
        
        updateFruitStockLabel(fruit: fruit, sender: stepper)
    }
    
    func applyFruitStockModification() {
        for fruit in JuiceMaker.common.fruits {
            guard let labelText = stockLabel[fruit.key.rawValue].text else {
                return showMachineErrorAlert()
            }
            
            guard let labelNumber: UInt = UInt(labelText) else {
                return showMachineErrorAlert()
            }
            
            let currentAmount: UInt = labelNumber - fruit.value.amount
            
            fruit.value.supply(amount: currentAmount)
        }
    }
    
    private func updateFruitStockLabel(fruit: Fruit.Name, sender: UIStepper? = nil) {
        guard let selectedFruit = JuiceMaker.common.fruits[fruit] else {
                return showMachineErrorAlert()
            }
        
        if let inputSender = sender {
            let inputValue = UInt(inputSender.value)
            stockLabel[fruit.rawValue].text = String(selectedFruit.amount + inputValue)
        } else {
            stockLabel[fruit.rawValue].text = String(selectedFruit.amount)
        }
    }
}
