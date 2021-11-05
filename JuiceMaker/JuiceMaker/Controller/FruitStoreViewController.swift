//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/25.
//

import UIKit

// MARK: - Properties and Lifecycle, Transition
class FruitStoreViewController: UIViewController {
    var juiceMaker: JuiceMaker?
    
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
        updateFruitLabels()
        updateFruitSteppers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fruitLabelChanged(notification:)), name: .changedFruitStockNotification, object: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Label and Stepper Values Setting
extension FruitStoreViewController {
    func updateFruitLabels() {
        guard let fruitStore = juiceMaker?.fruitStore else { return }
        do {
            let strawberryStock = try fruitStore.stock(fruit: .strawberry)
            let bananaStock = try fruitStore.stock(fruit: .banana)
            let pineappleStock = try fruitStore.stock(fruit: .pineapple)
            let kiwiStock = try fruitStore.stock(fruit: .kiwi)
            let mangoStock = try fruitStore.stock(fruit: .mango)
            
            updateCurrentStockLabel(stock: strawberryStock, label: strawberryStockLabel)
            updateCurrentStockLabel(stock: bananaStock, label: bananaStockLabel)
            updateCurrentStockLabel(stock: pineappleStock, label: pineappleStockLabel)
            updateCurrentStockLabel(stock: kiwiStock, label: kiwiStockLabel)
            updateCurrentStockLabel(stock: mangoStock, label: mangoStockLabel)
        } catch {
            guard let requestError = error as? RequestError else { return }
            showNotificationAlert(message: requestError.errorDescription)
        }
    }
    
    func updateFruitSteppers() {
        guard let fruitStore = juiceMaker?.fruitStore else { return }
        do {
            let strawberryStock = try fruitStore.stock(fruit: .strawberry)
            let bananaStock = try fruitStore.stock(fruit: .banana)
            let pineappleStock = try fruitStore.stock(fruit: .pineapple)
            let kiwiStock = try fruitStore.stock(fruit: .kiwi)
            let mangoStock = try fruitStore.stock(fruit: .mango)
            
            updeteCurrentStockStepper(stock: strawberryStock, stepper: strawberryStockStepper)
            updeteCurrentStockStepper(stock: bananaStock, stepper: bananaStockStepper)
            updeteCurrentStockStepper(stock: pineappleStock, stepper: pineappleStockStepper)
            updeteCurrentStockStepper(stock: kiwiStock, stepper: kiwiStockStepper)
            updeteCurrentStockStepper(stock: mangoStock, stepper: mangoStockStepper)
        } catch {
            guard let requestError = error as? RequestError else { return }
            showNotificationAlert(message: requestError.errorDescription)
        }
    }
    
    func updateCurrentStockLabel(stock: Int, label: UILabel) {
        label.text = stock.description
    }
    
    func updeteCurrentStockStepper(stock: Int, stepper: UIStepper) {
        stepper.value = Double(stock)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStockStepper:
            changeFruitStock(fruit: .strawberry, value: sender.value)
        case bananaStockStepper:
            changeFruitStock(fruit: .banana, value: sender.value)
        case pineappleStockStepper:
            changeFruitStock(fruit: .pineapple, value: sender.value)
        case kiwiStockStepper:
            changeFruitStock(fruit: .kiwi, value: sender.value)
        case mangoStockStepper:
            changeFruitStock(fruit: .mango, value: sender.value)
        default:
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
}

// MARK: Stepper Operation
extension FruitStoreViewController {
    func changeFruitStock(fruit: Fruit, value: Double) {
        let oldStockValue: Int
        let newStockValue = Int(value)
        guard let fruitStore = juiceMaker?.fruitStore else { return }

        do {
            oldStockValue = try fruitStore.stock(fruit: fruit)
            chooseCalculator(fruit: fruit, oldStockValue: oldStockValue, newStockValue: newStockValue)
        } catch {
            showNotificationAlert(message: Message.unknownError.description)
        }
    }

    func chooseCalculator(fruit: Fruit, oldStockValue: Int, newStockValue: Int) {
        guard let fruitStore = juiceMaker?.fruitStore else { return }

        if oldStockValue < newStockValue {
            let count = newStockValue - oldStockValue
            calculateFruitStock(fruit: fruit, count: count, calculate: fruitStore.addFruitStock)
        } else {
            let count = oldStockValue - newStockValue
            calculateFruitStock(fruit: fruit, count: count, calculate: fruitStore.subtractFruitStock)
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

// MARK: - Notification
extension FruitStoreViewController {
    @objc func fruitLabelChanged(notification: Notification) {
        guard let fruitStock = notification.object as? FruitStock else {
            showNotificationAlert(message: Message.unknownError.description)
            return
        }
        updateCurrentStockLabel(stock: fruitStock.stock, label: fruitlabel(of: fruitStock.fruit))
        updeteCurrentStockStepper(stock: fruitStock.stock, stepper: fruitStepper(of: fruitStock.fruit))
    }
    
    func fruitlabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLabel
        case .banana:
            return bananaStockLabel
        case .pineapple:
            return pineappleStockLabel
        case .kiwi:
            return kiwiStockLabel
        case .mango:
            return mangoStockLabel
        }
    }
    
    func fruitStepper(of fruit: Fruit) -> UIStepper {
        switch fruit {
        case .strawberry:
            return strawberryStockStepper
        case .banana:
            return bananaStockStepper
        case .pineapple:
            return pineappleStockStepper
        case .kiwi:
            return kiwiStockStepper
        case .mango:
            return mangoStockStepper
        }
    }
}
