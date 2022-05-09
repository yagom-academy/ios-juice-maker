//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 변재은 on 2022/05/09.
//

import UIKit

class FruitStoreViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = "\(fruitStore.stocks[.strawberry]!)"
        bananaLabel.text = "\(fruitStore.stocks[.banana]!)"
        pineappleLabel.text = "\(fruitStore.stocks[.pineapple]!)"
        kiwiLabel.text = "\(fruitStore.stocks[.kiwi]!)"
        mangoLabel.text = "\(fruitStore.stocks[.mango]!)"
        
        strawberryStepper.value = Double(fruitStore.stocks[.strawberry]!)
        bananaStepper.value = Double(fruitStore.stocks[.banana]!)
        pineappleStepper.value = Double(fruitStore.stocks[.pineapple]!)
        kiwiStepper.value = Double(fruitStore.stocks[.kiwi]!)
        mangoStepper.value = Double(fruitStore.stocks[.mango]!)
    }
    
    @IBAction func changeStepperValue(_ sender: UIStepper) {
        fruitStore.stocks[.strawberry]! = Int(strawberryStepper.value)
        strawberryLabel.text = "\(fruitStore.stocks[.strawberry]!)"
        
        fruitStore.stocks[.banana]! = Int(bananaStepper.value)
        bananaLabel.text = "\(fruitStore.stocks[.banana]!)"
        
        fruitStore.stocks[.pineapple]! = Int(pineappleStepper.value)
        pineappleLabel.text = "\(fruitStore.stocks[.pineapple]!)"
        
        fruitStore.stocks[.kiwi]! = Int(kiwiStepper.value)
        kiwiLabel.text = "\(fruitStore.stocks[.kiwi]!)"
        
        fruitStore.stocks[.mango]! = Int(mangoStepper.value)
        mangoLabel.text = "\(fruitStore.stocks[.mango]!)"
    }
}
