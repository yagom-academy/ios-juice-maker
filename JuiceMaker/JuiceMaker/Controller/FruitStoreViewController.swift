//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/25.
//

import UIKit

// MARK: - Properties and Lifecycle, Transition
class FruitStoreViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFruitStepperValues()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Label and Stepper Values Setting
extension FruitStoreViewController {
    @IBAction func  stepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStockStepper:
            strawberryStockLabel.text = fruitLabelText(value: sender.value)
            changeFruitStock(fruit: .strawberry, value: sender.value)
        case bananaStockStepper:
            bananaStockLabel.text = fruitLabelText(value: sender.value)
            changeFruitStock(fruit: .banana, value: sender.value)
        case pineappleStockStepper:
            pineappleStockLabel.text = fruitLabelText(value: sender.value)
            changeFruitStock(fruit: .pineapple, value: sender.value)
        case kiwiStockStepper:
            kiwiStockLabel.text = fruitLabelText(value: sender.value)
            changeFruitStock(fruit: .kiwi, value: sender.value)
        case mangoStockStepper:
            mangoStockLabel.text = fruitLabelText(value: sender.value)
            changeFruitStock(fruit: .mango, value: sender.value)
        default:
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
    
    func fruitLabelText(value: Double) -> String {
        return String(format: "%.0f", value)
    }
    
    func setUpFruitStepperValues() {
        updateCurrentStockStepperValue(fruit: .strawberry, stepper: strawberryStockStepper)
        updateCurrentStockStepperValue(fruit: .banana, stepper: bananaStockStepper)
        updateCurrentStockStepperValue(fruit: .pineapple, stepper: pineappleStockStepper)
        updateCurrentStockStepperValue(fruit: .kiwi, stepper: kiwiStockStepper)
        updateCurrentStockStepperValue(fruit: .mango, stepper: mangoStockStepper)
    }
    
    func updateCurrentStockStepperValue(fruit: Fruit, stepper: UIStepper) {
        do {
            let stock = try FruitStore.shared.stock(fruit: fruit)
            stepper.value = Double(stock)
        } catch {
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
}

// MARK: Stepper Operation
extension FruitStoreViewController {
    func changeFruitStock(fruit: Fruit, value: Double) {
        let oldStockValue: Int
        let newStockValue = Int(value)
        do {
            oldStockValue = try FruitStore.shared.stock(fruit: fruit)
            chooseCalculator(fruit: fruit, oldStockValue: oldStockValue, newStockValue: newStockValue)
        } catch {
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
    
    func chooseCalculator(fruit: Fruit, oldStockValue: Int, newStockValue: Int) {
        switch oldStockValue < newStockValue {
        case true:
            let count = newStockValue - oldStockValue
            calculateFruitStock(fruit: fruit, count: count, calculate: FruitStore.shared.addFruitStock)
        case false:
            let count = oldStockValue - newStockValue
            calculateFruitStock(fruit: fruit, count: count, calculate: FruitStore.shared.subtractFruitStock)
        }
    }
    
    func calculateFruitStock(fruit: Fruit, count: Int, calculate: (Fruit, Int) throws -> Void ) {
        do {
            try calculate(fruit, count)
        } catch {
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
    
    func showNotificationAlert(message: String, title: String = Text.ok.title) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: title, style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
