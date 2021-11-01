//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/25.
//

import UIKit

class FruitStoreViewController: UIViewController {

    var receivedText: String?
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
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStockStepper:
            strawberryStockLabel.text = String(format: "%.0f", sender.value)
        case bananaStockStepper:
            bananaStockLabel.text = String(format: "%.0f", sender.value)
        case pineappleStockStepper:
            pineappleStockLabel.text = String(format: "%.0f", sender.value)
        case kiwiStockStepper:
            kiwiStockLabel.text = String(format: "%.0f", sender.value)
        case mangoStockStepper:
            mangoStockLabel.text = String(format: "%.0f", sender.value)
        default:
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
    
    func setUpFruitStepperValues() {
        currentStockStepperValueUpdate(fruit: .strawberry, stepper: strawberryStockStepper)
        currentStockStepperValueUpdate(fruit: .banana, stepper: bananaStockStepper)
        currentStockStepperValueUpdate(fruit: .pineapple, stepper: pineappleStockStepper)
        currentStockStepperValueUpdate(fruit: .kiwi, stepper: kiwiStockStepper)
        currentStockStepperValueUpdate(fruit: .mango, stepper: mangoStockStepper)
    }
    
    func currentStockStepperValueUpdate(fruit: Fruit, stepper: UIStepper) {
        do {
            let stock = try FruitStore.shared.stock(fruit: fruit)
            stepper.value = Double(stock)
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
