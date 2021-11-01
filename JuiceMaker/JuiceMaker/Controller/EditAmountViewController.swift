//
//  EditAmountViewController.swift
//  JuiceMaker
//
//  Created by 장영우 on 2021/10/27.
//

import UIKit

class EditAmountViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
    @IBOutlet private weak var strawberryAmountLabel: UILabel!
    @IBOutlet private weak var bananaAmountLabel: UILabel!
    @IBOutlet private weak var mangoAmountLabel: UILabel!
    @IBOutlet private weak var kiwiAmountLabel: UILabel!
    @IBOutlet private weak var pineappleAmountLabel: UILabel!
    
    @IBOutlet private weak var strawberryAmountStepper: UIStepper!
    @IBOutlet private weak var bananaAmountStepper: UIStepper!
    @IBOutlet private weak var mangoAmountStepper: UIStepper!
    @IBOutlet private weak var kiwiAmountStepper: UIStepper!
    @IBOutlet private weak var pineappleAmountStepper: UIStepper!
    
    @IBAction private func fruitAmountSteppersHandler(_ stepper: UIStepper) {
        switch stepper {
        case strawberryAmountStepper:
            strawberryAmountLabel.text = String(Int(stepper.value))
        case bananaAmountStepper:
            bananaAmountLabel.text = String(Int(stepper.value))
        case mangoAmountStepper:
            mangoAmountLabel.text = String(Int(stepper.value))
        case kiwiAmountStepper:
            kiwiAmountLabel.text = String(Int(stepper.value))
        case pineappleAmountStepper:
            pineappleAmountLabel.text = String(Int(stepper.value))
        default:
            fatalError("Undefined Button")
        }
    }

    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try updateFruitAmountLabels()
            try updateFruitAmountSteppers()
        } catch JuiceMakerError.fruitNotFound {
            fatalError("Fruit Not Found")
        } catch {
            fatalError("Undefined Error")
        }
    }
    
    private func updateFruitAmountLabels() throws {
        guard let strawberryAmount = fruitStore.inventory[.strawberry],
              let bananaAmount = fruitStore.inventory[.banana],
              let mangoAmount = fruitStore.inventory[.mango],
              let kiwiAmount = fruitStore.inventory[.kiwi],
              let pineappleAmount = fruitStore.inventory[.pineapple] else {
                  throw JuiceMakerError.fruitNotFound
              }
        
        strawberryAmountLabel.text = String(strawberryAmount)
        bananaAmountLabel.text = String(bananaAmount)
        mangoAmountLabel.text = String(mangoAmount)
        kiwiAmountLabel.text = String(kiwiAmount)
        pineappleAmountLabel.text = String(pineappleAmount)
    }
    
    private func updateFruitAmountSteppers() throws {
        guard let strawberryAmount = fruitStore.inventory[.strawberry],
              let bananaAmount = fruitStore.inventory[.banana],
              let mangoAmount = fruitStore.inventory[.mango],
              let kiwiAmount = fruitStore.inventory[.kiwi],
              let pineappleAmount = fruitStore.inventory[.pineapple] else {
                  throw JuiceMakerError.fruitNotFound
              }
        
        strawberryAmountStepper.value = Double(strawberryAmount)
        bananaAmountStepper.value = Double(bananaAmount)
        mangoAmountStepper.value = Double(mangoAmount)
        kiwiAmountStepper.value = Double(kiwiAmount)
        pineappleAmountStepper.value = Double(pineappleAmount)
    }
}
