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
    var previousViewController: JuiceMakerViewController?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
        //addObserverFruitsStockDelivered()
    }
    
    @IBAction private func pressBackBarButton(_ sender: UIBarButtonItem) {
        postFruitsStockDidModified()
        dismiss(animated: true)
    }
    
    @IBAction private func pressStepper(_ sender: UIStepper) {
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
    
    //MARK: - Label Method
    private func updateFruitsStockLabels(_ stock: [Fruit:Int]?) {
        stock?.forEach {
            modifyFruitStockLabel($0.key.rawValue, $0.value)
        }
    }
    
    private func modifyFruitStockLabel(_ fruit: String, _ stock: Int) {
        let allStockLabels: [UILabel] = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        allStockLabels.filter({ $0.accessibilityIdentifier == fruit }).forEach {
            $0.text = String(stock)
        }
    }
    
    //MARK: - Stepper Method
    private func updateStepperValue() {
        let fruitsSteppers: [Fruit: UIStepper] = [
            .strawberry: strawberryStepper,
            .banana: bananaStepper,
            .pineapple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        fruitsSteppers.forEach {
            $0.value.value = Double(fruitsStock[$0.key] ?? stepperDefaultValue)
        }
    }
}

//MARK: - FruitStoreDelegate
extension FruitStoreViewController: FruitsStockDelegate {
    func updateFruitsStock(_ fruitStocks: [Fruit : Int]?) {
        print("ASDASDASDASDSDA")
        guard let deliveredFruitsStock = fruitStocks else {
            return
        }
        fruitsStock = deliveredFruitsStock
        updateFruitsStockLabels(self.fruitsStock)
        updateStepperValue()
    }
}


//MARK: - Notification
extension FruitStoreViewController {
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
