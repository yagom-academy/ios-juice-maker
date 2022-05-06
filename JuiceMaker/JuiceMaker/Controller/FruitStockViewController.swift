//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/05/05.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet  weak var strawberryLabel: UILabel!
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
    
    private func updateFruitLabel() {
        strawberryLabel.text = String(Int(strawberryStepper.value))
        bananaLabel.text = String(Int(bananaStepper.value))
        pineappleLabel.text = String(Int(pineappleStepper.value))
        kiwiLabel.text = String(Int(kiwiStepper.value))
        mangoLabel.text = String(Int(mangoStepper.value))
    }
    
    func updateStepperValue() {
        strawberryStepper.value = Double(FruitStockViewController.strawberryText)!
        bananaStepper.value = Double(FruitStockViewController.bananaText)!
        pineappleStepper.value = Double(FruitStockViewController.pineappleText)!
        kiwiStepper.value = Double(FruitStockViewController.kiwiText)!
        mangoStepper.value = Double(FruitStockViewController.mangoText)!
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
        updateFruitLabel()
    }
}



