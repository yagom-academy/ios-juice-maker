//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 홍정아 on 2021/06/14.
//

import UIKit

enum StepperError: Error {
    case invalidFruitStepper
}

class FruitStoreViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAllFruitStockLabelsAndSteppers()
    }
    
    func initializeAllFruitStockLabelsAndSteppers() {
        initializeStockLabelAndStepper(of: .strawberry, label: strawberryStockLabel)
        initializeStockLabelAndStepper(of: .banana, label: bananaStockLabel)
        initializeStockLabelAndStepper(of: .pineapple, label: pineappleStockLabel)
        initializeStockLabelAndStepper(of: .kiwi, label: kiwiStockLabel)
        initializeStockLabelAndStepper(of: .mango, label: mangoStockLabel)
    }

    func initializeStockLabelAndStepper(of fruit: Fruit, label: UILabel) {
        do {
            let currentStock = try fruitStore.showStockLeft(fruit: fruit)
            let fruitStepper = findStepper(of: fruit)
            fruitStepper.value = Double(currentStock)
            label.text = String(currentStock)
        } catch FruitStoreError.invalidFruit {
            showNotificationAlert(message: "없는 과일입니다.", actionTitle: "OK")
        } catch {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
        }
    }
    
    func findFruit(from sender: UIStepper) throws -> UILabel {
        switch sender {
        case strawberryStepper:
            return strawberryStockLabel
        case bananaStepper:
            return bananaStockLabel
        case pineappleStepper:
            return pineappleStockLabel
        case kiwiStepper:
            return kiwiStockLabel
        case mangoStepper:
            return mangoStockLabel
        default:
            throw StepperError.invalidFruitStepper
        }
    }

    @IBAction func fruitStepperTapped(_ sender: UIStepper) {
        do {
            let fruitStockLabel = try findFruit(from: sender)
            fruitStockLabel.text = Int(sender.value).description
        } catch StepperError.invalidFruitStepper {
            showNotificationAlert(message: "잘못된 UIStepper입니다.", actionTitle: "OK")
        } catch {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
        }
    }

    func findStepper(of fruit: Fruit) -> UIStepper {
        switch fruit {
        case .strawberry:
            return strawberryStepper
        case .banana:
            return bananaStepper
        case .pineapple:
            return pineappleStepper
        case .kiwi:
            return kiwiStepper
        case .mango:
            return mangoStepper
        }
    }
    
    func updateFruitStock(of fruit: Fruit) {
        let fruitStepper = findStepper(of: fruit)
        let fruitStock = Int(fruitStepper.value)
        do {
            try fruitStore.updateStock(of: fruit, by: fruitStock)
        } catch FruitStoreError.invalidFruit {
            showNotificationAlert(message: "없는 과일입니다.", actionTitle: "OK")
        } catch FruitStoreError.stockBelowMinimum {
            showNotificationAlert(message: "과일재고는 음수가 될 수 없습니다.", actionTitle: "OK")
        } catch {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        for fruit in Fruit.allCases {
            updateFruitStock(of: fruit)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showNotificationAlert(message: String, actionTitle: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
