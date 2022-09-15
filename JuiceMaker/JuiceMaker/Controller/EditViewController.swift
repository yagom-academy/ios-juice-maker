//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    private var store: FruitStore?
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store?.setQueuedStock()
        updateStockCount()
        setStepperValue()
    }
    
    func setStore(from store: FruitStore) {
        self.store = store
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        store?.confirmChange()
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedStepper(_ sender: UIStepper) {
        let fruitIndex = sender.tag, newCount = sender.value
        
        fruitCountLabels?[fruitIndex].text = Int(newCount).description
        store?.changeQueueStock(fruitIndex: fruitIndex, count: Int(newCount))
    }
    
    private func updateStockCount() {
        guard var newStock = store?.queuedStock else { return }
        
        for fruitCountLabel in fruitCountLabels {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
    
    private func setStepperValue() {
        guard let stock = store?.queuedStock else { return }
        
        fruitSteppers.forEach { fruitStepper in
            let fruitIndex = fruitStepper.tag
            
            fruitStepper.value = Double(stock[fruitIndex])
        }
    }
}
