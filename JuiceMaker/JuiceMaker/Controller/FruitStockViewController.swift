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
    
    var numberOfStrawberry = ""
    var numberOfBanana = ""
    var numberOfPineapple = ""
    var numberOfKiwi = ""
    var numberOfMango = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        strawberryStockStepper.value = Double(numberOfStrawberry) ?? 0
        bananaStockStepper.value = Double(numberOfBanana) ?? 0
        pineappleStockStepper.value = Double(numberOfPineapple) ?? 0
        kiwiStockStepper.value = Double(numberOfKiwi) ?? 0
        mangoStockStepper.value = Double(numberOfMango) ?? 0
    }
    
    private func updateFruitLabel() {
        strawberryLabel.text = String(Int(strawberryStockStepper.value))
        bananaLabel.text = String(Int(bananaStockStepper.value))
        pineappleLabel.text = String(Int(pineappleStockStepper.value))
        kiwiLabel.text = String(Int(kiwiStockStepper.value))
        mangoLabel.text = String(Int(mangoStockStepper.value))
    }
    
    private func updateNumberOfFruit() {
        numberOfStrawberry = strawberryLabel.text ?? ""
        numberOfBanana = bananaLabel.text ?? ""
        numberOfPineapple = pineappleLabel.text ?? ""
        numberOfKiwi = kiwiLabel.text ?? ""
        numberOfMango = mangoLabel.text ?? ""
    }
    
    private func postUpdateFruitStockNotification() {
        center.post(name: .updateFruitStock, object: nil, userInfo: ["딸기재고": numberOfStrawberry, "바나나재고": numberOfBanana, "파인애플재고": numberOfPineapple, "키위재고": numberOfKiwi, "망고재고": numberOfMango])
    }
    
    @IBAction private func changeValueOfStrawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfBananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfPineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfKiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func changeValueOfMangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postUpdateFruitStockNotification()
    }
    
    @IBAction private func closeButtonTouchedUpInside(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
