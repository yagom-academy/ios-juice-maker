//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printStock()
                
    }
    
    func printStock() {
        let fruitStoreInventory = juiceMaker.fetchStock()
        
        strawberryQuantityLabel.text = String(fruitStoreInventory[.strawberry] ?? 0)
        bananaQuantityLabel.text = String(fruitStoreInventory[.banana] ?? 0)
        pineappleQuantityLabel.text = String(fruitStoreInventory[.pineapple] ?? 0)
        kiwiQuantityLabel.text = String(fruitStoreInventory[.kiwi] ?? 0)
        mangoQuantityLabel.text = String(fruitStoreInventory[.mango] ?? 0)
    }


}

