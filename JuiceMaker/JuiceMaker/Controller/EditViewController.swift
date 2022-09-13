//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    var store: FruitStore?
    var stock: [Int]?
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockCount()
        setStepperValue()
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        print(Int(sender.value))
    }
    private func updateStockCount() {
        guard var newStock = stock else { return }
        
        for fruitCountLabel in fruitCountLabels {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
    
    func setStore(from store: FruitStore) {
        self.store = store
        self.stock = store.stock
    }
    
    func setStepperValue() {
        strawberryStepper.value = Double(stock?[0] ?? 0)
        bananaStepper.value = Double(stock?[1] ?? 0)
        pineappleStepper.value = Double(stock?[2] ?? 0)
        kiwiStepper.value = Double(stock?[3] ?? 0)
        mangoStepper.value = Double(stock?[4] ?? 0)
    }
    
}
