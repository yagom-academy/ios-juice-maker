//
//  BViewController.swift
//  JuiceMaker
//
//  Created by 허건 on 2022/05/04.
//

import UIKit

class BViewController: UIViewController {
    // var juiceMaker = JuiceMaker()
    var fruitStore = FruitStore.shared

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stockBanana: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
        stepper.value = Double(fruitStore.stocks[.strawberry]!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        print("stocks: \(fruitStore.stocks[.strawberry]!)")
        print(type(of: fruitStore.stocks[.strawberry]!))
        print("stepper: \(stepper.value)")
        print(type(of: stepper.value))
        
        sender.value = stepper.value
        valueLabel.text = Int(sender.value).description
        fruitStore.stocks[.strawberry]! = Int(stepper.value)

        print("stocksAfter: \(fruitStore.stocks[.strawberry]!)")
        print(type(of: fruitStore.stocks[.strawberry]!))
        print("stepperAfter: \(stepper.value)")
        print(type(of: stepper.value))
    }

    func updateStock() {
        guard let strawberry = fruitStore.stocks[.strawberry]
        else {
            return
        }
        guard let banana = fruitStore.stocks[.banana]
        else {
            return
        }
        valueLabel.text = "\(strawberry)"
        stockBanana.text = "\(banana)"
    }
}
