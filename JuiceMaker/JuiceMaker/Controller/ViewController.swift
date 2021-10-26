//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAmountLabels()
    }
    
    func updateAmountLabels() {
        strawberryAmountLabel.text = String(fruitStore.inventory[.strawberry] ?? 0)
        bananaAmountLabel.text = String(fruitStore.inventory[.banana] ?? 0)
        mangoAmountLabel.text = String(fruitStore.inventory[.mango] ?? 0)
        kiwiAmountLabel.text = String(fruitStore.inventory[.kiwi] ?? 0)
        pineappleAmountLabel.text = String(fruitStore.inventory[.pineapple] ?? 0)
    }
}

