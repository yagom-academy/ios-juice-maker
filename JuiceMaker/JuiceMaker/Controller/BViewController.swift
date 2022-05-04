//
//  BViewController.swift
//  JuiceMaker
//
//  Created by 허건 on 2022/05/04.
//

import UIKit

class BViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard var strawberry = juiceMaker.fruitStore.stocks[.strawberry]
        else {
            return
        }
        strawberry += 1
        updateStock()

        valueLabel.text = Int(sender.value).description
    }
    
    func updateStock() {
        guard var strawberry = juiceMaker.fruitStore.stocks[.strawberry]
        else {
            return
        }
        valueLabel.text = "\(strawberry)"
//        bananaLabel.text = "\(banana)"
//        kiwiLabel.text = "\(kiwi)"
//        mangoLabel.text = "\(mango)"
//        pineappleLabel.text = "\(pineapple)"
    }
}
