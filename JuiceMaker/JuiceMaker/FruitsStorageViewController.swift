//
//  FruitsStorageViewController.swift
//  JuiceMaker
//
//  Created by TORI on 2021/03/18.
//

import UIKit

class FruitsStorageViewController: UIViewController {
    var fruitsStorage = FruitsStorage.sharedInstance
    
    @IBOutlet var strawberryStockStepperLabel: UILabel!
    @IBOutlet var bananaStockStepperLabel: UILabel!
    @IBOutlet var pineappleStockStepperLabel: UILabel!
    @IBOutlet var kiwiStockStepperLabel: UILabel!
    @IBOutlet var mangoStockStepperLabel: UILabel!
    
    @IBOutlet var strawberryStepperBtn: UIStepper!
    @IBOutlet var bananaStepperBtn: UIStepper!
    @IBOutlet var kiwiStepperBtn: UIStepper!
    @IBOutlet var pineappleStepperBtn: UIStepper!
    @IBOutlet var mangoStepperBtn: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRemainedFruitsStock()
    }
    
    @IBAction func closeToFruitsStorage(_ sender: UIButton) {
        dismiss(animated: true)
        updateVCStockText()
    }
    
    @IBAction func strawberryStepperBtn(_ sender: UIStepper) {
        strawberryStockStepperLabel.text = String(Int(strawberryStepperBtn.value))
    }
    
    @IBAction func bananaStepperBtn(_ sender: UIStepper) {
        bananaStockStepperLabel.text = String(Int(bananaStepperBtn.value))
    }
    
    @IBAction func kiwiStepperBtn(_ sender: UIStepper) {
        kiwiStockStepperLabel.text = String(Int(kiwiStepperBtn.value))
    }
    
    @IBAction func pineappleStepperBtn(_ sender: UIStepper) {
        pineappleStockStepperLabel.text = String(Int(pineappleStepperBtn.value))
    }
    
    @IBAction func mangoStepperBtn(_ sender: UIStepper) {
        mangoStockStepperLabel.text = String(Int(mangoStepperBtn.value))
    }

    func showRemainedFruitsStock() {
        strawberryStepperBtn.value = Double(fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)] ?? 0)
        strawberryStockStepperLabel.text = String(Int(strawberryStepperBtn.value))
        bananaStepperBtn.value = Double(fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)] ?? 0)
        bananaStockStepperLabel.text = String(Int(bananaStepperBtn.value))
        pineappleStepperBtn.value = Double(fruitsStorage.fruitsStock[ObjectIdentifier(Pineapple.self)] ?? 0)
        pineappleStockStepperLabel.text = String(Int(pineappleStepperBtn.value))
        kiwiStepperBtn.value = Double(fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)] ?? 0)
        kiwiStockStepperLabel.text = String(Int(kiwiStepperBtn.value))
        mangoStepperBtn.value = Double(fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)] ?? 0)
        mangoStockStepperLabel.text = String(Int(mangoStepperBtn.value))
    }
    
    func updateVCStockText() {
        typealias stock = (fruit: ObjectIdentifier, stepper: Int )
        
        let stepperNumbers: [stock] = [(ObjectIdentifier(Strawberry.self), Int(strawberryStepperBtn.value)),
                                       (ObjectIdentifier(Banana.self), Int(bananaStepperBtn.value)),
                                       (ObjectIdentifier(Pineapple.self), Int(pineappleStepperBtn.value)),
                                       (ObjectIdentifier(Kiwi.self), Int(kiwiStepperBtn.value)),
                                       (ObjectIdentifier(Mango.self), Int(mangoStepperBtn.value))]
        
        for number in stepperNumbers {
            if fruitsStorage.fruitsStock[number.fruit]! - number.stepper > 0 {
                fruitsStorage.reduceFruit(number.fruit, amount:  fruitsStorage.fruitsStock[number.fruit]! - number.stepper)
            } else {
                fruitsStorage.addFruit(number.fruit, amount: -(fruitsStorage.fruitsStock[number.fruit]! - number.stepper))
            }
        }
    }
}
