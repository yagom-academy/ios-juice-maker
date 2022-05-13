//
//  JuiceMaker - FruitStockViewController.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet private var fruitsLabel: [UILabel]!
    @IBOutlet private var fruitsStepper: [UIStepper]!
    
    var fruitStore: FruitStore? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        for index in 0..<(fruitStore?.fruitWarehouse.count ?? 0) {
            fruitsStepper[index].value = Double(fruitStore?.fruitWarehouse[Fruit(rawValue: index) ?? Fruit.unknownFruit] ?? 0)
        }
    }
    
    private func updateFruitLabel() {
        for index in 0..<fruitsLabel.count {
            fruitsLabel[index].text = String(Int(fruitsStepper[index].value))
        }
    }
    
    private func postUpdateFruitStockNotification() {
        center.post(name: .updateFruitStock, object: nil, userInfo: ["updatedFruitStock": fruitsLabel ?? []])
    }
    
    @IBAction private func changeValueOfStrawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction private func changeValueOfBananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction private func changeValueOfPineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction private func changeValueOfKiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction private func changeValueOfMangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction private func closeButtonTouchedUpInside(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        postUpdateFruitStockNotification()
    }
}
