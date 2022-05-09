//
//  File.swift
//  JuiceMaker
//
//  Created by NAMU on 2022/05/02.
//

import UIKit

final class FruitStoreViewController: UIViewController {
    private var fruitsStock: [Fruit: Int] = [:]
    private let stepperDefaultValue: Int = 0
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserverFruitsStockDelivered()
    }

    @IBAction private func pressBackBarButton(_ sender: UIBarButtonItem) {
        postFruitsStockDidModified()
        dismiss(animated: true)
    }
    
    @IBAction func pressStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            fruitsStock[.strawberry] = Int(sender.value)
        case bananaStepper:
            fruitsStock[.banana] = Int(sender.value)
        case pineappleStepper:
            fruitsStock[.pineapple] = Int(sender.value)
        case kiwiStepper:
            fruitsStock[.kiwi] = Int(sender.value)
        case mangoStepper:
            fruitsStock[.mango] = Int(sender.value)
        default:
            break
        }
        updateFruitsStockLabels(fruitsStock)
    }
    
    private func updateFruitsStockLabels(_ stock: [Fruit:Int]?) {
        stock?.forEach { (key: Fruit, value: Int) in
            modifyFruitStockLabel(key.rawValue, value)
        }
    }
    
    private func modifyFruitStockLabel(_ fruit: String, _ stock: Int) {
        let allStockLabels: [UILabel] = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        for uiLabel in allStockLabels.filter({ $0.accessibilityIdentifier == fruit }) {
            uiLabel.text = String(stock)
        }
    }
    
    private func updateStepperValue() {
        let fruitsSteppers: [Fruit: UIStepper] = [
            .strawberry: strawberryStepper,
            .banana: bananaStepper,
            .pineapple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        fruitsSteppers.forEach { (key: Fruit, stepper: UIStepper) in
            stepper.value = Double(fruitsStock[key] ?? stepperDefaultValue)
        }
    }
    
    private func addObserverFruitsStockDelivered() {
        NotificationCenter.default.addObserver(forName: NotificationName.fruitsStockDelivered, object: nil, queue: nil) { Notification in
            guard let deliveredFruitsStock = Notification.userInfo as? [Fruit: Int] else {
                return
            }
            self.fruitsStock = deliveredFruitsStock
            self.updateFruitsStockLabels(self.fruitsStock)
            self.updateStepperValue()
        }
    }
    
    private func postFruitsStockDidModified() {
        NotificationCenter.default.post(name: NotificationName.fruitsStockDidModified, object: nil, userInfo: fruitsStock)
    }
}
