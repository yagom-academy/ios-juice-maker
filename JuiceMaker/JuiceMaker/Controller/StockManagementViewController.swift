//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by KimJaeYoun on 2021/06/17.
//

import UIKit

//MARK:- Stored Property and LifeCycle
class StockManagementViewController: UIViewController {
    
    @IBOutlet private var numberOfStrawberryLabel: UILabel!
    @IBOutlet private var numberOfBananaLabel: UILabel!
    @IBOutlet private var numberOfPineAppleLabel: UILabel!
    @IBOutlet private var numberOfKiwiLabel: UILabel!
    @IBOutlet private var numberOfMangoLabel: UILabel!
    
    @IBOutlet private var stockOfStrawberryStepper: UIStepper!
    @IBOutlet private var stockOfBananaStepper: UIStepper!
    @IBOutlet private var stockOfPineAppleStepper: UIStepper!
    @IBOutlet private var stockOfKiwiStepper: UIStepper!
    @IBOutlet private var stockOfMangoStepper: UIStepper!
    
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumberOnLabel(fruits: fruitStore?.inventory ?? [:])
    }

}

//MARK:- Label and Stepper Setting
extension StockManagementViewController {
    private func setUp(number: Int, on label: UILabel) {
        label.text = String(number)
    }
    
    private func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberryLabel)
            case .banana:
                setUp(number: fruit.value, on: numberOfBananaLabel)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineAppleLabel)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwiLabel)
            case .mango:
                setUp(number: fruit.value, on: numberOfMangoLabel)
            }
        }
    }
    
    private func setUpTargetActionOnSteppers() {
        stockOfStrawberryStepper.addTarget(self, action: #selector(fruitsAmountDidChange(_:)), for: .valueChanged)
        stockOfBananaStepper.addTarget(self, action: #selector(fruitsAmountDidChange(_:)), for: .valueChanged)
        stockOfPineAppleStepper.addTarget(self, action: #selector(fruitsAmountDidChange(_:)), for: .valueChanged)
        stockOfKiwiStepper.addTarget(self, action: #selector(fruitsAmountDidChange(_:)), for: .valueChanged)
        stockOfMangoStepper.addTarget(self, action: #selector(fruitsAmountDidChange(_:)), for: .valueChanged)
    }
}

//MARK:- Stepper Operation Related
extension StockManagementViewController {
    @objc func fruitsAmountDidChange(_ sender: UIStepper) {
        switch sender {
        case stockOfStrawberryStepper:
            fruitStore?.changeAmount(of: .strawberry, to: Int(sender.value))
        case stockOfBananaStepper:
            fruitStore?.changeAmount(of: .banana, to: Int(sender.value))
        case stockOfPineAppleStepper:
            fruitStore?.changeAmount(of: .pineapple, to: Int(sender.value))
        case stockOfKiwiStepper:
            fruitStore?.changeAmount(of: .kiwi, to: Int(sender.value))
        case stockOfMangoStepper:
            fruitStore?.changeAmount(of: .mango, to: Int(sender.value))
        default:
            break
        }
    }
}
