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
    
    private func updateStockToLabel() {
        fruitStore.fruitQuantity.forEach{(key, value) in
            switch key {
            case .strawberry:
                strawberryLabel.text = String(value)
                strawberryStepper.value = Double(value)
            case .banana:
                bananaLabel.text = String(value)
                bananaStepper.value = Double(value)
            case .kiwi:
                kiwiLabel.text = String(value)
                kiwiStepper.value = Double(value)
            case .mango:
                mangoLabel.text = String(value)
                mangoStepper.value = Double(value)
            case .pineapple:
                pineappleLabel.text = String(value)
                pineappleStepper.value = Double(value)
            }
        }
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
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
        Fruit.allCases.forEach { fruit in
            switch fruit {
            case .strawberry:
                fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: strawberryLabel.text))
            case .banana:
                fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: bananaLabel.text))
            case .kiwi:
                fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: kiwiLabel.text))
            case .mango:
                fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: mangoLabel.text))
            case .pineapple:
                fruitStore.updateFruitQuantity(fruit: fruit, count: transformStringToInt(label: pineappleLabel.text))
            }
        }
    }
}
