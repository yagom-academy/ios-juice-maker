//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE
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
        setStockAndStepper()
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
    
    func setStockAndStepper() {
        if let strawberry = fruitStore.stocks[.strawberry],
           let banana = fruitStore.stocks[.banana],
           let kiwi = fruitStore.stocks[.kiwi],
           let mango = fruitStore.stocks[.mango],
           let pineapple = fruitStore.stocks[.pineapple] {
            
            strawberryLabel.text = "\(strawberry)"
            bananaLabel.text = "\(banana)"
            pineappleLabel.text = "\(pineapple)"
            kiwiLabel.text = "\(kiwi)"
            mangoLabel.text = "\(mango)"
            
            strawberryStepper.value = Double(strawberry)
            bananaStepper.value = Double(banana)
            pineappleStepper.value = Double(pineapple)
            kiwiStepper.value = Double(kiwi)
            mangoStepper.value = Double(mango)
        }
    }
}
