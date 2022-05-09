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
    
    static var numberOfStrawberry = ""
    static var numberOfBanana = ""
    static var numberOfPineapple = ""
    static var numberOfKiwi = ""
    static var numberOfMango = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        strawberryStockStepper.value = Double(FruitStockViewController.numberOfStrawberry) ?? 0
        bananaStockStepper.value = Double(FruitStockViewController.numberOfBanana) ?? 0
        pineappleStockStepper.value = Double(FruitStockViewController.numberOfPineapple) ?? 0
        kiwiStockStepper.value = Double(FruitStockViewController.numberOfKiwi) ?? 0
        mangoStockStepper.value = Double(FruitStockViewController.numberOfMango) ?? 0
    }
    
    private func updateFruitLabel() {
        strawberryLabel.text = String(Int(strawberryStockStepper.value))
        bananaLabel.text = String(Int(bananaStockStepper.value))
        pineappleLabel.text = String(Int(pineappleStockStepper.value))
        kiwiLabel.text = String(Int(kiwiStockStepper.value))
        mangoLabel.text = String(Int(mangoStockStepper.value))
    }
    
    private func updateNumberOfFruit() {
        FruitStockViewController.numberOfStrawberry = strawberryLabel.text ?? ""
        FruitStockViewController.numberOfBanana = bananaLabel.text ?? ""
        FruitStockViewController.numberOfPineapple = pineappleLabel.text ?? ""
        FruitStockViewController.numberOfKiwi = kiwiLabel.text ?? ""
        FruitStockViewController.numberOfMango = mangoLabel.text ?? ""
    }
    
    private func postCheckFruitStockNotification() {
        center.post(name: .checkFruitStock, object: nil)
    }
    
    @IBAction private func strawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postCheckFruitStockNotification()
    }
    
    @IBAction private func bananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postCheckFruitStockNotification()
    }
    
    @IBAction private func pineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postCheckFruitStockNotification()
    }
    
    @IBAction private func kiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postCheckFruitStockNotification()
    }
    
    @IBAction private func mangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateNumberOfFruit()
        postCheckFruitStockNotification()
    }
    
    @IBAction private func closeCurrentView(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
