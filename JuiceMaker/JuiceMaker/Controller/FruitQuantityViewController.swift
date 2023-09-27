//
//  FruitQuantityViewController.swift
//  JuiceMaker
//
//  Created by 김우현 on 2023/09/19.
//

import UIKit

final class FruitQuantityViewController: UIViewController {
    static let id = String(describing: FruitQuantityViewController.self)
    
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var strawberryLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideBackButton()
        updateStockToLabel()
    }
    
    private func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    private func transformStringToInt(label: String?) -> Int {
        guard let stringLabel = label, 
                let number = Int(stringLabel) else { return 0 }
        return number
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        switch sender {
        case strawberryStepper:
            strawberryLabel.text = String(value)
        case bananaStepper:
            bananaLabel.text = String(value)
        case pineappleStepper:
            pineappleLabel.text = String(value)
        case kiwiStepper:
            kiwiLabel.text = String(value)
        case mangoStepper:
            mangoLabel.text = String(value)
        default:
            break
        }
    }
    
    private func updateStockToLabel() {
        fruitStore.fruitQuantity.forEach{(fruit, count) in
            let (label, stepper) = convertFruitsToUIComponents(from: fruit)
            label.text = String(count)
            stepper.value = Double(count)
        }
    }
    
    private func convertFruitsToUIComponents(from fruit: Fruit) -> (label: UILabel, stepper: UIStepper) {
        switch fruit {
        case .strawberry:
            return (strawberryLabel, strawberryStepper)
        case .banana:
            return (bananaLabel, bananaStepper)
        case .kiwi:
            return (kiwiLabel, kiwiStepper)
        case .mango:
           return (mangoLabel, mangoStepper)
        case .pineapple:
           return (pineappleLabel, pineappleStepper)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
        Fruit.allCases.forEach { fruit in
            let label = convertFruitsToUIComponents(from: fruit).label
            fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: label.text))
        }
    }
}
