//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    private var store: FruitStore?
    private var stock: [Int]?
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockCount()
        setStepperValue()
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        guard let newStock = stock else { return }
        
        for (fruitIndex, newFruit) in newStock.enumerated() {
            store?.changeStock(fruitIndex: fruitIndex, count: newFruit)
        }
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedStepper(_ sender: UIStepper) {
        fruitCountLabels?[sender.tag].text = Int(sender.value).description
        stock?[sender.tag] = Int(sender.value)
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
    
    private func setStepperValue() {
        guard let stock = stock else { return }
        
        for fruitStepper in fruitSteppers {
            fruitStepper.value = Double(stock[fruitStepper.tag])
        }
    }
    
}
