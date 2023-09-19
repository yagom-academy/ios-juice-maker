//
//  JuiceMaker - ViewController.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
    var fruitStore = FruitStore.shared
    var fruitJuice: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }

    func showStock() {
        fruitStore.fruitQuantity.forEach{(key, value) in
            switch key {
            case .strawberry:
                strawberryLabel.text = String(value)
            case .banana:
                bananaLabel.text = String(value)
            case .kiwi:
                kiwiLabel.text = String(value)
            case .mango:
                mangoLabel.text = String(value)
            case .pineapple:
                pineappleLabel.text = String(value)
            }
        }
    }
    
    @IBAction func manufactureJuice(_ sender: UIButton) {
        guard let order = sender.currentTitle else { return }
        guard let juice = FruitJuice.Order(rawValue: order)?.juiceOrder else { return }
        do {
            try juiceMaker.manufactureFruitJuice(in: juice)
            fruitJuice = juice.rawValue
            showStock()
        } catch {
            
        }
    }

}

