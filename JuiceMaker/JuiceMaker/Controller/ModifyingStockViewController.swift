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
            try configureStockUI()
        } catch (let error) {
            showFailedOrder(with: error)
        }
    }
    
    static func instance(fruitStore: FruitStore) -> ModifyingStockViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyborad.instantiateViewController(withIdentifier: identifier) as? ModifyingStockViewController else {
            return ModifyingStockViewController()
        }
        viewController.fruitStore = fruitStore
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        do {
            try configureStockUI()
        } catch (let error) {
            showFailedOrder(with: error)
        }
    }
    
    private func configureStockUI() throws {
        var stockUIComponent: [(UILabel, UIStepper)] = []
        let fruits = Fruit.allCases
        
        fruits
            .forEach { fruit in
                stockUIComponent.append(findStockUIComponent(of: fruit))
            }
        
        try match(stockUIComponent: stockUIComponent, with: fruits)
    }
    
    private func match(stockUIComponent: [(label: UILabel, stepper: UIStepper)], with fruits: [Fruit]) throws {
        var currentIndex = stockUIComponent.startIndex
        
        for fruit in fruits {
            let currentLabel = stockUIComponent[currentIndex].label
            let currentStepper = stockUIComponent[currentIndex].stepper
            
            guard let fruitAmount = fruitStore?.stocks[fruit] else {
                throw JuiceMakerError.notFoundFruit
            }
            
            currentLabel.text = String(fruitAmount)
            currentStepper.value = Double(fruitAmount)
            currentIndex = stockUIComponent.index(after: currentIndex)
        }
    }
    
    private func findStockUIComponent(of fruit: Fruit) -> (UILabel, UIStepper) {
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
    
    private func showFailedOrder(with error: Error) {
        guard let error = error as? JuiceMakerError,
              let errorDescription = error.errorDescription else {
                  return
              }
        
        AlertBuilder(viewController: self)
            .setTitle(errorDescription)
            .setConfirmTitle("확인")
            .showAlert()
    }
}
