//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/05/05.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    static var strawberryText = ""
    static var bananaText = ""
    static var pineappleText = ""
    static var kiwiText = ""
    static var mangoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperValue()
        updateFruitLabel()
    }
    
    private func updateStepperValue() {
        strawberryStepper.value = Double(FruitStockViewController.strawberryText) ?? 0
        bananaStepper.value = Double(FruitStockViewController.bananaText) ?? 0
        pineappleStepper.value = Double(FruitStockViewController.pineappleText) ?? 0
        kiwiStepper.value = Double(FruitStockViewController.kiwiText) ?? 0
        mangoStepper.value = Double(FruitStockViewController.mangoText) ?? 0
    }
    
    private func updateFruitLabel() {
        strawberryLabel.text = String(Int(strawberryStepper.value))
        bananaLabel.text = String(Int(bananaStepper.value))
        pineappleLabel.text = String(Int(pineappleStepper.value))
        kiwiLabel.text = String(Int(kiwiStepper.value))
        mangoLabel.text = String(Int(mangoStepper.value))
    }
    
    private func updateText() {
        FruitStockViewController.strawberryText = strawberryLabel.text ?? ""
        FruitStockViewController.bananaText = bananaLabel.text ?? ""
        FruitStockViewController.pineappleText = pineappleLabel.text ?? ""
        FruitStockViewController.kiwiText = kiwiLabel.text ?? ""
        FruitStockViewController.mangoText = mangoLabel.text ?? ""
    }
    
    @IBAction private func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func strawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateText()
        center.post(name: .name, object: nil)
    }
    
    @IBAction private func bananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateText()
        center.post(name: .name, object: nil)
    }
    
    @IBAction private func pineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateText()
        center.post(name: .name, object: nil)
    }
    
    @IBAction private func kiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateText()
        center.post(name: .name, object: nil)
    }
    
    @IBAction private func mangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
        updateText()
        center.post(name: .name, object: nil)
    }
}



