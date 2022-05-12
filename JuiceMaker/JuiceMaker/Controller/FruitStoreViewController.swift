//
//  File.swift
//  JuiceMaker
//
//  Created by NAMU on 2022/05/02.
//

import UIKit

final class FruitStoreViewController: UIViewController {
    var fruitsStock: [Fruit: Int] = [:]
    private let stepperDefaultValue: Int = 0
    weak var delegate: FruitsStockDelegate?
    
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
        updateFruitsStockLabels(fruitsStock)
        updateStepperValue()
    }
    
    @IBAction private func pressBackBarButton(_ sender: UIButton) {
        delegate?.updateFruitsStock(fruitsStock)
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
