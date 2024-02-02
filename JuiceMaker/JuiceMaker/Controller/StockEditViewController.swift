//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

final class StockEditViewController: UIViewController, StockEditViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let stockEditView = self.view as? StockEditView else {
            return
        }
        stockEditView.delegate = self
        
        updateAllFruitQuantityLabel(stockEditView)
        updateAllFruitStepperValue(stockEditView)
    }
    
    func dismissStockEditView() {
        self.dismiss(animated: true)
    }
    
    func updateSingleFruitStock(fruit: Fruit, quantity: Int) {
        FruitStore.shared.setQuantity(of: fruit, to: quantity)
        
        NotificationCenter.default.post(name: NSNotification.Name("FruitQuantityHasBeenUpdated"),
                                        object: self,
                                        userInfo: ["changedFruit": fruit])
    }
    
    func updateSingleFruitQuantityLabel(_ view: StockEditView, fruit: Fruit) {
        guard let quantity = try? FruitStore.shared.getQuantity(of: fruit) else {
            return
        }
        
        view.updateSingleFruitQuantityLabel(fruit: fruit, quantity: quantity)
    }
    
    func updateSingleFruitStepperValue(_ view: StockEditView, fruit: Fruit) {
        guard let quantity = try? FruitStore.shared.getQuantity(of: fruit) else {
            return
        }
        
        view.updateSingleFruitStepperValue(fruit: fruit, quantity: quantity)
    }
    
    func updateAllFruitQuantityLabel(_ view: StockEditView) {
        for fruit in Fruit.allCases {
            updateSingleFruitQuantityLabel(view, fruit: fruit)
        }
    }

    func updateAllFruitStepperValue(_ view: StockEditView) {
        for fruit in Fruit.allCases {
            updateSingleFruitStepperValue(view, fruit: fruit)
        }
    }
}
