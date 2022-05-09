//
//  BViewController.swift
//  JuiceMaker
//
//  Created by 허건 on 2022/05/04.
//

import UIKit

class BViewController: UIViewController {
    var fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
        strawberryStepper.value = Double(fruitStore.stocks[.strawberry]!)
        bananaStepper.value = Double(fruitStore.stocks[.banana]!)
        pineappleStepper.value = Double(fruitStore.stocks[.pineapple]!)
        kiwiStepper.value = Double(fruitStore.stocks[.kiwi]!)
        mangoStepper.value = Double(fruitStore.stocks[.mango]!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        strawberryStock.text = Int(strawberryStepper.value).description
        bananaStock.text = Int(bananaStepper.value).description
        pineappleStock.text = Int(pineappleStepper.value).description
        kiwiStock.text = Int(kiwiStepper.value).description
        mangoStock.text = Int(mangoStepper.value).description

        fruitStore.stocks[.strawberry]! = Int(strawberryStepper.value)
        fruitStore.stocks[.banana]! = Int(bananaStepper.value)
        fruitStore.stocks[.pineapple]! = Int(pineappleStepper.value)
        fruitStore.stocks[.kiwi]! = Int(kiwiStepper.value)
        fruitStore.stocks[.mango]! = Int(mangoStepper.value)

    }

    func updateStock() {
        guard let strawberry = fruitStore.stocks[.strawberry],
              let banana = fruitStore.stocks[.banana],
              let pineapple = fruitStore.stocks[.pineapple],
              let kiwi = fruitStore.stocks[.kiwi],
              let mango = fruitStore.stocks[.mango]
        else {
            return
        }
        strawberryStock.text = "\(strawberry)"
        bananaStock.text = "\(banana)"
        pineappleStock.text = "\(pineapple)"
        kiwiStock.text = "\(kiwi)"
        mangoStock.text = "\(mango)"
    }
}
