//
//  JuiceMaker - FruitStockViewController.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    var fruitStore: FruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        strawberryStockStepper.value = Double(fruitStore.fruitWarehouse[.strawberry] ?? 0)
        bananaStockStepper.value = Double(fruitStore.fruitWarehouse[.banana] ?? 0)
        pineappleStockStepper.value = Double(fruitStore.fruitWarehouse[.pineapple] ?? 0)
        kiwiStockStepper.value = Double(fruitStore.fruitWarehouse[.kiwi] ?? 0)
        mangoStockStepper.value = Double(fruitStore.fruitWarehouse[.mango] ?? 0)
    }
    
    private func updateFruitLabel() {
        strawberryLabel.text = String(Int(strawberryStockStepper.value))
        bananaLabel.text = String(Int(bananaStockStepper.value))
        pineappleLabel.text = String(Int(pineappleStockStepper.value))
        kiwiLabel.text = String(Int(kiwiStockStepper.value))
        mangoLabel.text = String(Int(mangoStockStepper.value))
    }
    
    private func postUpdateFruitStockNotification() {
        center.post(name: .updateFruitStock, object: nil, userInfo: ["딸기재고": strawberryLabel.text ?? "", "바나나재고": bananaLabel.text ?? "", "파인애플재고": pineappleLabel.text ?? "", "키위재고": kiwiLabel.text ?? "", "망고재고": mangoLabel.text ?? ""])
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
