//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 홍정아 on 2021/06/14.
//

import UIKit

enum StepperError: Error {
    case invalidFruitStepper
}

class FruitStoreViewController: UIViewController {

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
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func findFruit(from sender: UIStepper) throws -> UILabel {
        switch sender {
        case strawberryStepper:
            return strawberryStockLabel
        case bananaStepper:
            return bananaStockLabel
        case pineappleStepper:
            return pineappleStockLabel
        case kiwiStepper:
            return kiwiStockLabel
        case mangoStepper:
            return mangoStockLabel
        default:
            throw StepperError.invalidFruitStepper
        }
    }
    
    @IBAction func fruitStepperTapped(_ sender: UIStepper) {
        guard let fruitStockLabel = try? findFruit(from: sender) else {
            return
        }
        fruitStockLabel.text = Int(sender.value).description
    }
    
    func findStepper(of fruit: Fruit) -> UIStepper {
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
    
    func updateFruitStock(of fruit: Fruit) {
        let fruitStepper = findStepper(of: fruit)
        let fruitStock = Int(fruitStepper.value)
        do {
            try fruitStore.updateStock(of: fruit, by: fruitStock)
        } catch {
            print("updateStock Error")
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        for fruit in Fruit.allCases {
            updateFruitStock(of: fruit)
        }
        dismiss(animated: true, completion: nil)
    }
}
