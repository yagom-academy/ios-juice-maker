//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import UIKit

class StockModifyViewController: UIViewController {

    private let stepperMaximumValue: Double = 2.0
    private let stepperMinimumValue: Double = -2.0
    private let stepperDefaultValue: Double = 0.0
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private  weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    
    var juiceMaker: JuiceMaking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didFruitStockChange(_:)), name: .FruitStockChanged, object: nil)
        initializeFruitStockLabels()
        initializeSteppers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .FruitStockChanged, object: nil)
    }
}

// MARK: - IBAction Method
extension StockModifyViewController {
    @IBAction private func stepperDidTap(_ sender: UIStepper) {
        do {
            let fruitToModify = try fruit(for: sender)
            try modifyStock(of: fruitToModify, by: sender.value)
        } catch FruitStoreError.stockShortage {
            
        } catch let error {
            showErrorAlert(error: error)
        }
        resetValue(ofStepper: sender)
    }
    
    @IBAction private func modifyCompleteButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - View Method
extension StockModifyViewController {
    private func initializeSteppers() {
        fruitStockSteppers.forEach { stepper in
            stepper.minimumValue = stepperMinimumValue
            stepper.maximumValue = stepperMaximumValue
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
    
    private func resetValue(ofStepper stepper: UIStepper) {
        stepper.value = stepperDefaultValue
    }
}

// MARK: - Model Method
extension StockModifyViewController {
    private func modifyStock(of fruitToModify: Fruit, by stepperValue: Double) throws {
        try juiceMaker?.changeFruitStock(of: fruitToModify, by: 1, calculate: calculation(for: stepperValue))
    }
    
    private func calculation(for stepperValue: Double) throws -> (Int,Int) -> Int {
        if stepperValue > stepperDefaultValue {
            return (+)
        } else if stepperValue < stepperDefaultValue {
            return (-)
        } else {
            throw FruitStoreError.unexpectedStepperValue
        }
    }
    
    private func fruit(for stepper: UIStepper) throws -> Fruit {
        switch stepper {
        case strawberryStockStepper:
            return .strawberry
        case bananaStockStepper:
            return .banana
        case pineappleStockStepper:
            return .pineapple
        case kiwiStockStepper:
            return .kiwi
        case mangoStockStepper:
            return .mango
        default:
            throw FruitStoreError.invalidModification
        }
    }
}

// MARK: - NotificationCenter Method
extension StockModifyViewController {
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
}

// MARK: - Alert Method
extension StockModifyViewController {
    private func showErrorAlert(error: Error) {
        let alertController = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
