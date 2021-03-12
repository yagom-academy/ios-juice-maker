//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    @IBAction func juiceOrderButton(_ sender: Any) {
        let kindOrderButton = sender as! UIButton
        print("\(kindOrderButton.currentTitle!)")
    }
    
    override func viewDidLoad() {
        let juiceMaker = JuiceMaker()
        let totalFruitStock = juiceMaker.currentFruitStock()
        
        strawberryLabel.text = String(totalFruitStock[.strawberry]!)
        bananaLabel.text = String(totalFruitStock[.banana]!)
        pineappleLabel.text = String(totalFruitStock[.pineapple]!)
        mangoLabel.text = String(totalFruitStock[.mango]!)
        kiwiLabel.text = String(totalFruitStock[.kiwi]!)
    }

}

