//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import UIKit

class StockModifyViewController: UIViewController {

    let stepperMaximumValue = 1.0
    let stepperMinimumValue = -1.0
    let stepperDefaultValue = 0.0
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!

    var juiceMaker: JuiceMaking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didFruitStockChange(_:)), name: .FruitStockChanged, object: nil)
        initializeFruitStockLabels()
        initializeSteppers()
    }
    
    @IBAction func stepperDidTap(_ sender: UIStepper) {
        do {
            let fruitToModify = try fruit(for: sender)
            try modifyStock(of: fruitToModify, by: sender)
//            try! updateLabel(fruit: fruitToModify)
        } catch let error {
            showErrorAlert(error: error)
        }
        resetValue(ofStepper: sender)
    }
    
    @objc private func didFruitStockChange(_ notification: Notification) {
        guard let fruit = notification.object as? Fruit else {
            showErrorAlert(error: FruitStoreError.invalidFruit)
            return
        }
        do{
            try updateLabel(fruit: fruit)
        } catch let error {
            showErrorAlert(error: error)
        }
    }
    
    func modifyStock(of fruitToModify: Fruit, by stepper: UIStepper) throws {
        try juiceMaker?.changeFruitStock(of: fruitToModify, by: 1, calculate: calculation(for: stepper))
    }
    
    func calculation(for stepper: UIStepper) throws -> (Int,Int) -> Int {
        if stepper.value == stepperMaximumValue {
            return (+)
        } else if stepper.value == stepperMinimumValue {
            return (-)
        } else {
            throw FruitStoreError.unexpectedStepperValue
        }
    }
    
    func initializeSteppers() {
        strawberryStockStepper.minimumValue = stepperMinimumValue
        bananaStockStepper.minimumValue = stepperMinimumValue
        pineappleStockStepper.minimumValue = stepperMinimumValue
        kiwiStockStepper.minimumValue = stepperMinimumValue
        mangoStockStepper.minimumValue = stepperMinimumValue
        strawberryStockStepper.maximumValue = stepperMaximumValue
        bananaStockStepper.maximumValue = stepperMaximumValue
        pineappleStockStepper.maximumValue = stepperMaximumValue
        kiwiStockStepper.maximumValue = stepperMaximumValue
        mangoStockStepper.maximumValue = stepperMaximumValue
    }
    
    func resetValue(ofStepper stepper: UIStepper) {
        stepper.value = stepperDefaultValue
    }
    
    func fruit(for stepper: UIStepper) throws -> Fruit {
        if stepper === strawberryStockStepper {
            return .strawberry
        } else if stepper === bananaStockStepper {
            return .banana
        } else if stepper === pineappleStockStepper {
            return .pineapple
        } else if stepper === kiwiStockStepper {
            return .kiwi
        } else if stepper === mangoStockStepper {
            return .mango
        } else {
            throw FruitStoreError.invalidModification
        }
    }
    
    private func updateLabel(fruit: Fruit) throws {
        guard let juiceMaker = juiceMaker else {
            throw FruitStoreError.stockDataMissing
        }
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(try juiceMaker.currentFruitStock(of: .strawberry))
        case .banana:
            bananaStockLabel.text = String(try juiceMaker.currentFruitStock(of: .banana))
        case .pineapple:
            pineappleStockLabel.text = String(try juiceMaker.currentFruitStock(of: .pineapple))
        case .kiwi:
            kiwiStockLabel.text = String(try juiceMaker.currentFruitStock(of: .kiwi))
        case .mango:
            mangoStockLabel.text = String(try juiceMaker.currentFruitStock(of: .mango))
        }
    }
    
    private func initializeFruitStockLabels() {
        guard let juiceMaker = juiceMaker else {
            showErrorAlert(error: FruitStoreError.stockDataMissing)
            return
        }
        do {
            strawberryStockLabel.text = String(try juiceMaker.currentFruitStock(of: .strawberry))
            bananaStockLabel.text = String(try juiceMaker.currentFruitStock(of: .banana))
            pineappleStockLabel.text = String(try juiceMaker.currentFruitStock(of: .pineapple))
            kiwiStockLabel.text = String(try juiceMaker.currentFruitStock(of: .kiwi))
            mangoStockLabel.text = String(try juiceMaker.currentFruitStock(of: .mango))
        } catch let error {
            showErrorAlert(error: error)
        }
    }

    private func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok.korean, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction private func modifyCompleteButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
