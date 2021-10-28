//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet var stockOfStrawberry: UILabel!
    @IBOutlet var stockOfBanana: UILabel!
    @IBOutlet var stockOfPineapple: UILabel!
    @IBOutlet var stockOfKiwi: UILabel!
    @IBOutlet var stockOfMango: UILabel!
    
    @IBAction func orderJuice(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStock: [Fruit: String] = juiceMaker.checkFruitStock()
        changeStockLabel(to: fruitStock)
    }
    
    func changeStockLabel(to fruitStock: [Fruit: String]) {
        for (fruit, stock) in fruitStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberry.text = stock
            case .banana:
                stockOfBanana.text = stock
            case .pineapple:
                stockOfPineapple.text = stock
            case .kiwi:
                stockOfKiwi.text = stock
            case .mango:
                stockOfMango.text = stock
            }
        }
    }
}
