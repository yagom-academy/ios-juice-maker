//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 변재은 on 2022/05/09.
//

import UIKit

class FruitStoreViewController: UIViewController {
    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
        updateStepperValue()
    }
    
    @IBAction func changeStepperValue(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            switch fruit {
            case .strawberry:
                strawberryLabel.text = "\(Int(strawberryStepper.value))"
                fruitStore.stocks[fruit] = Int(strawberryStepper.value)
                
            case .banana:
                bananaLabel.text = "\(Int(bananaStepper.value))"
                fruitStore.stocks[fruit] = Int(bananaStepper.value)
                
            case .pineapple:
                pineappleLabel.text = "\(Int(pineappleStepper.value))"
                fruitStore.stocks[fruit] = Int(pineappleStepper.value)
                
            case .kiwi:
                kiwiLabel.text = "\(Int(kiwiStepper.value))"
                fruitStore.stocks[fruit] = Int(kiwiStepper.value)
                
            case .mango:
                mangoLabel.text = "\(Int(mangoStepper.value))"
                fruitStore.stocks[fruit] = Int(mangoStepper.value)
            }
        }
    }
    
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func updateStock() {
        strawberryLabel.text = "\(fruitStore.stocks[.strawberry]!)"
        bananaLabel.text = "\(fruitStore.stocks[.banana]!)"
        pineappleLabel.text = "\(fruitStore.stocks[.pineapple]!)"
        kiwiLabel.text = "\(fruitStore.stocks[.kiwi]!)"
        mangoLabel.text = "\(fruitStore.stocks[.mango]!)"
    }
    
    func updateStepperValue() {
        strawberryStepper.value = Double(fruitStore.stocks[.strawberry]!)
        bananaStepper.value = Double(fruitStore.stocks[.banana]!)
        pineappleStepper.value = Double(fruitStore.stocks[.pineapple]!)
        kiwiStepper.value = Double(fruitStore.stocks[.kiwi]!)
        mangoStepper.value = Double(fruitStore.stocks[.mango]!)
    }
    
}
