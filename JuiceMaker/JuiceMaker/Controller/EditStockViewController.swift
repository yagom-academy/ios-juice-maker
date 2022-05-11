//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/03.
//

import UIKit

class EditStockViewController: UIViewController {
    var fruitStock = [Fruit: Int]()
    weak var delegate: DeliverFruitStockDelegate?
    
    @IBOutlet var fruitStockLabel: [FruitStockLabel]!
    @IBOutlet var editStockStepper: [EditStockStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel(stock: fruitStock)
        
        editStockStepper.forEach { stepper in
            stepper.addTarget(self, action: #selector(updateFruitStock), for: .valueChanged)
            
            guard let fruit = stepper.convertToFruit(),
                  let amount = fruitStock[fruit]
            else {
                return
            }
            stepper.value = Double(amount)
        }
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        delegate?.transferFruit(stock: fruitStock)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateFruitStockLabel(stock: [Fruit: Int]) {
        fruitStockLabel.forEach { label in
            guard let fruit = label.convertToFruit(),
                  let fruitLabel = stock[fruit]
            else {
                return
            }
            label.text = "\(fruitLabel)"
        }
    }
    
    @objc func updateFruitStock(_ sender: EditStockStepper) {
        guard let fruit = sender.convertToFruit()
        else {
            return
        }
        fruitStock[fruit] = Int(sender.value)
        
        updateFruitStockLabel(stock: fruitStock)
    }
}
