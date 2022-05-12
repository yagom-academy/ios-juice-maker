//
//  JuiceMaker - FruitStockViewController.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet private var fruitsLabel: [UILabel]!
    @IBOutlet private var fruitsStepper: [UIStepper]!
    
    var fruitStore: FruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        for fruits in 0..<fruitStore.fruitWarehouse.count {
            fruitsStepper[fruits].value = Double(fruitStore.fruitWarehouse[Fruit(rawValue: fruits) ?? Fruit.unknownFruit] ?? 0)
        }
    }
    
    private func updateFruitLabel() {
        for fruits in 0..<fruitsLabel.count {
            fruitsLabel[fruits].text = String(Int(fruitsStepper[fruits].value))
        }
    }
    
    private func postUpdateFruitStockNotification() {
        center.post(name: .updateFruitStock, object: nil, userInfo: ["딸기재고": fruitsLabel[0].text ?? "", "바나나재고": fruitsLabel[1].text ?? "", "파인애플재고": fruitsLabel[2].text ?? "", "키위재고": fruitsLabel[3].text ?? "", "망고재고": fruitsLabel[4].text ?? ""])
    }
    
    @IBAction private func changeValueOfStrawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfBananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfPineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfKiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfMangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func closeButtonTouchedUpInside(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
