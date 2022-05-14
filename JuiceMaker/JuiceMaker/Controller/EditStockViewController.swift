//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/03.
//

import UIKit

class EditStockViewController: UIViewController {
    var fruits = FruitInventory()
    weak var delegate: EditStockViewControllerDelegate?
    
    @IBOutlet private var fruitStockLabel: [FruitStockLabel]!
    @IBOutlet private var editStockStepper: [EditStockStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(from: fruits.currentStock)
        configureEditStockSteppers()
    }
    
    private func updateLabel(from stock: [Fruit: Int]) {
        fruitStockLabel.forEach { $0.configure(with: stock) }
    }
    
    func configureEditStockSteppers() {
        editStockStepper.forEach {
            $0.addTarget(
                self,
                action: #selector(updateStepperValue),
                for: .valueChanged
            )
            $0.configure(with: fruits.currentStock)
        }
    }
    
    @objc private func updateStepperValue(_ stepper: EditStockStepper) {
        guard let fruit = stepper.convertToFruit()
        else {
            return
        }
        fruits.currentStock[fruit] = Int(stepper.value)
        
        updateLabel(from: fruits.currentStock)
    }
    
    @IBAction private func tapCloseButton(_ sender: Any) {
        delegate?.editStockViewControllerDidChangeStock(
            fruits.currentStock,
            self
        )
        self.dismiss(animated: true, completion: nil)
    }
}
