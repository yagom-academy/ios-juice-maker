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
        updateFruitStockLabel()        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        restock()
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
        
        makeStepperValueChanged(fruit: fruit, sender: stepper)
    }
    
    func makeStepperValueChanged(fruit: Fruit.Name, sender: UIStepper) {
        let inputValue = UInt(sender.value)
        guard let selectedFruit = JuiceMaker.common.fruits[fruit] else {
            return showMachineErrorAlert()
        }

        stockLabel[fruit.rawValue].text = String(selectedFruit.amount + inputValue)
    }
    
    func restock() {
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
    
    private func updateFruitStockLabel() {
        for fruitName in JuiceMaker.common.fruits {
            guard let fruit = JuiceMaker.common.fruits[fruitName.key] else {
                return showMachineErrorAlert()
            }
            
            stockLabel[fruitName.key.rawValue].text = String(fruit.amount)
        }
    }
}
