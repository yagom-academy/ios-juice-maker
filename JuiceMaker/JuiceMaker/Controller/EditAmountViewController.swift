//
//  EditAmountViewController.swift
//  JuiceMaker
//
//  Created by Yohan on 2021/10/27.
//

import UIKit

class EditAmountViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    private let feedbackGenerator = UISelectionFeedbackGenerator()
    
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
            editFruitAmount(fruit: .strawberry, from: stepper)
        case bananaAmountStepper:
            editFruitAmount(fruit: .banana, from: stepper)
        case mangoAmountStepper:
            editFruitAmount(fruit: .mango, from: stepper)
        case kiwiAmountStepper:
            editFruitAmount(fruit: .kiwi, from: stepper)
        case pineappleAmountStepper:
            editFruitAmount(fruit: .pineapple, from: stepper)
        default:
            showAppTerminatingAlert()
        }
        
        feedbackGenerator.selectionChanged()
    }

    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        notificationCenter.post(name: .didEditAmount, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try updateAllFruitAmountLabels()
            try initializeAllFruitAmountSteppers()
        } catch {
            showAppTerminatingAlert()
        }
    }
    
    private func updateAllFruitAmountLabels() throws {
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
    
    private func initializeAllFruitAmountSteppers() throws {
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
    
    private func updateFruitStoreInventory(fruit: Fruit, from stepper: UIStepper) throws {
        let stepperValue = Int(stepper.value)
        
        
        guard let inventoryValue = fruitStore.inventory[fruit] else {
            throw JuiceMakerError.fruitNotFound
        }
        
        if stepperValue >= inventoryValue {
            try fruitStore.increase(fruit, amount: stepperValue - inventoryValue)
        } else {
            try fruitStore.decrease(fruit, amount: inventoryValue - stepperValue)
        }
    }
    
    private func editFruitAmount(fruit: Fruit, from stepper: UIStepper) {
        do {
            try updateFruitStoreInventory(fruit: fruit, from: stepper)
            try updateAllFruitAmountLabels()
        } catch {
            showAppTerminatingAlert()
        }
    }
    
    private func showAppTerminatingAlert() {
        let title = "시스템 오류가 발생했습니다."
        let message = "앱이 5초 뒤 종료됩니다...\n개발자에게 문의해주세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let terminateAction = UIAlertAction(title: "지금 종료", style: .destructive) { _ in
            exit(-1)
        }
        
        alert.addAction(terminateAction)
        present(alert, animated: true) {
            sleep(5)
            exit(-1)
        }
    }
}
