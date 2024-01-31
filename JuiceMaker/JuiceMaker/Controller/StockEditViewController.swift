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
    
    func exitStockEditView() {
        self.dismiss(animated: true)
    }
    
    func updateSingleFruitStock(fruit: Fruit, quantity: Int) {
        FruitStore.shared.fruitBox[fruit] = quantity
        NotificationCenter.default.post(Notification(name: NSNotification.Name("FruitQuantityHasBeenUpdated")))
    }
    
    func updateSingleFruitQuantityLabel(_ view: StockEditView, fruit: Fruit) {
        guard let quantity = FruitStore.shared.fruitBox[fruit] else {
            return
        }
        
        view.updateSingleFruitQuantityLabel(fruit: fruit, quantity: quantity)
    }
    
    func updateSingleFruitStepperValue(_ view: StockEditView, fruit: Fruit) {
        guard let quantity = FruitStore.shared.fruitBox[fruit] else {
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
