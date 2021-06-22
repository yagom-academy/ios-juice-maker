//
//  StockManageView.swift
//  JuiceMaker
//
//  Created by WANKI KIM on 2021/06/17.
//

import UIKit

extension Notification.Name {
    static let recieveStockChangeNotification = Notification.Name("DidReceiveStockChange")
}

class StockManageViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var fineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var fineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    @IBAction private func strawberryStepperValueChange(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        NotificationCenter.default.post(name: .recieveStockChangeNotification, object: nil, userInfo: ["fruit": (FruitStore.HandlingFruit.strawberry, Int(sender.value))])
    }
    
    @IBAction private func bananaStepperValueChange(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
        NotificationCenter.default.post(name: .recieveStockChangeNotification, object: nil, userInfo: ["fruit": (FruitStore.HandlingFruit.banana, Int(sender.value))])
    }
    
    @IBAction private func fineappleStepperValueChange(_ sender: UIStepper) {
        fineappleStockLabel.text = Int(sender.value).description
        NotificationCenter.default.post(name: .recieveStockChangeNotification, object: nil, userInfo: ["fruit": (FruitStore.HandlingFruit.fineapple, Int(sender.value))])
    }
    
    @IBAction private func kiwiStepperValueChange(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
        NotificationCenter.default.post(name: .recieveStockChangeNotification, object: nil, userInfo: ["fruit": (FruitStore.HandlingFruit.kiwi, Int(sender.value))])
    }
    
    @IBAction private func mangoStepperValueChange(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
        NotificationCenter.default.post(name: .recieveStockChangeNotification, object: nil, userInfo: ["fruit": (FruitStore.HandlingFruit.mango, Int(sender.value))])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruitStockLabels()
    }
    
    private func initFruitStockLabels(){
        let fruits = FruitStore.shared.fruitStock
        for (fruit, amount) in fruits {
            switch fruit {
            case.strawberry:
                strawberryStockLabel.text = "\(amount)"
                strawberryStockStepper.value = Double(amount)
            case.banana:
                bananaStockLabel.text = "\(amount)"
                bananaStockStepper.value = Double(amount)
            case.fineapple:
                fineappleStockLabel.text = "\(amount)"
                fineappleStockStepper.value = Double(amount)
            case.kiwi:
                kiwiStockLabel.text = "\(amount)"
                kiwiStockStepper.value = Double(amount)
            case.mango:
                mangoStockLabel.text = "\(amount)"
                mangoStockStepper.value = Double(amount)
            }
        }
    }
    
    @IBAction private func ClickCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
