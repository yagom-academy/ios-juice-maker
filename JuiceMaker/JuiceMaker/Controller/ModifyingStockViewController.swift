//
//  ModifyingStockViewController.swift
//  JuiceMaker
//
//  Created by 조민호 on 2022/02/25.
//

import UIKit

final class ModifyingStockViewController: UIViewController {
    private var fruitStore: FruitStore?
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        do {
            try modifyFruitStock(stepper: sender)
            updateLabel(stepper: sender)
        } catch {
            
        }
    }
    
    static func instance(fruitStore: FruitStore) -> ModifyingStockViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyborad.instantiateViewController(withIdentifier: String(describing: self)) as? ModifyingStockViewController else {
            return ModifyingStockViewController()
        }
        viewController.fruitStore = fruitStore
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try setDefaultValues()
            try setDefaultLabels()
        } catch {
            
        }
    }
    
    private func findStockUI(of fruit: Fruit) -> (UILabel, UIStepper) {
        switch fruit {
        case .strawberry:
            return (strawberryAmountLabel, strawberryStepper)
        case .banana:
            return (bananaAmountLabel, bananaStepper)
        case .pineapple:
            return (pineappleAmountLabel, pineappleStepper)
        case .kiwi:
            return (kiwiAmountLabel, kiwiStepper)
        case .mango:
            return (mangoAmountLabel, mangoStepper)
        }
    }
    
    private func setDefaultValues() throws {
        for fruit in Fruit.allCases {
            let stepper = find(fruit: fruit)
            guard let amount = try fruitStore?.checkStock(of: fruit) else {
                throw JuiceMakerError.notFoundFruit
            }
            stepper.value = Double(amount)
        }
    }
    
    private func find(fruit: Fruit) -> UIStepper {
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
    
    private func setDefaultLabels() throws {
        let labels = Fruit.allCases.map { fruit in
            findLabel(fruit: fruit)
        }
        
        for label in labels {
            let fruit = find(label: label)
            guard let amount = try fruitStore?.checkStock(of: fruit) else {
                throw JuiceMakerError.notFoundFruit
            }
            
            label.text = String(amount)
        }
    }
    
    private func findLabel(fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryAmountLabel
        case .banana:
            return bananaAmountLabel
        case .pineapple:
            return pineappleAmountLabel
        case .kiwi:
            return kiwiAmountLabel
        case .mango:
            return mangoAmountLabel
        }
    }
    
    private func find(label: UILabel) -> Fruit {
        switch label {
        case strawberryAmountLabel:
            return .strawberry
        case bananaAmountLabel:
            return .banana
        case pineappleAmountLabel:
            return .pineapple
        case kiwiAmountLabel:
            return .kiwi
        case mangoAmountLabel:
            return .mango
        default:
            return .strawberry
        }
    }
    
    private func updateLabel(stepper: UIStepper) {
        let label = findLabel(stepper: stepper)
        label.text = String(Int(stepper.value))
    }
    
    private func findLabel(stepper: UIStepper) -> UILabel {
        switch stepper {
        case strawberryStepper:
            return strawberryAmountLabel
        case bananaStepper:
            return bananaAmountLabel
        case pineappleStepper:
            return pineappleAmountLabel
        case kiwiStepper:
            return kiwiAmountLabel
        case mangoStepper:
            return mangoAmountLabel
        default:
            return strawberryAmountLabel
        }
    }
    
    private func modifyFruitStock(stepper: UIStepper) throws {
        switch stepper {
        case strawberryStepper:
            updateFruitStock(fruit: .strawberry, stepper: strawberryStepper)
        case bananaStepper:
            updateFruitStock(fruit: .banana, stepper: bananaStepper)
        case pineappleStepper:
            updateFruitStock(fruit: .pineapple, stepper: pineappleStepper)
        case kiwiStepper:
            updateFruitStock(fruit: .kiwi, stepper: kiwiStepper)
        case mangoStepper:
            updateFruitStock(fruit: .mango, stepper: mangoStepper)
        default:
            throw JuiceMakerError.notFoundFruit
        }
    }
    
    private func updateFruitStock(fruit: Fruit, stepper: UIStepper) {
        let currentStepperValue = Int(stepper.value)
        fruitStore?.modify(fruit: fruit, amount: currentStepperValue)
    }
}
