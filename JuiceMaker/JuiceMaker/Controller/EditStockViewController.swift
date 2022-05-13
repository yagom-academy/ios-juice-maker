//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/03.
//

import UIKit

class EditStockViewController: UIViewController {
    var fruitsStock = [Fruit: Int]()
    weak var delegate: EditStockViewControllerDelegate?
    
    @IBOutlet private var fruitStockLabel: [FruitStockLabel]!
    @IBOutlet private var editStockStepper: [EditStockStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(from: fruitsStock)
        
        editStockStepper.forEach { stepper in
            stepper.addTarget(self, action: #selector(updateStepperValue), for: .valueChanged)
            
            guard let fruit = stepper.convertToFruit(),
                  let amount = fruitsStock[fruit]
            else {
                return
            }
            stepper.value = Double(amount)
        }
    }
    
    private func updateLabel(from stock: [Fruit: Int]) {
        fruitStockLabel.forEach { label in
            guard let fruit = label.convertToFruit(),
                  let fruitLabel = stock[fruit]
            else {
                return
            }
            label.text = "\(fruitLabel)"
        }
    }
    
    @objc private func updateStepperValue(_ stepper: EditStockStepper) {
        guard let fruit = stepper.convertToFruit()
        else {
            return
        }
        fruitsStock[fruit] = Int(stepper.value)
        
        updateLabel(from: fruitsStock)
    }
    
    @IBAction private func tapCloseButton(_ sender: Any) {
        delegate?.EditStockViewControllerDidChangeStock(fruitsStock)
        self.dismiss(animated: true, completion: nil)
    }
}
