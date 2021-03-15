//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var strawberryStock: StockLabel!
    @IBOutlet var bananaStock: StockLabel!
    @IBOutlet var pineappleStock: StockLabel!
    @IBOutlet var kiwiStock: StockLabel!
    @IBOutlet var mangoStock: StockLabel!
    @IBOutlet var strawBananaButton: JuiceButton!
    @IBOutlet var mangoKiwiButton: JuiceButton!
    @IBOutlet var strawberryButton: JuiceButton!
    @IBOutlet var bananaButton: JuiceButton!
    @IBOutlet var pineappleButton: JuiceButton!
    @IBOutlet var kiwiButton: JuiceButton!
    @IBOutlet var mangoButton: JuiceButton!
    

    @IBAction func touchUpJuiceButton(_ sender: JuiceButton) {
        if sender.juice.canMake {
            JuiceMaker.make(sender.juice)
            successAlert(sender.juice)
        } else {
            failAlert()
        }
        update()
        
    }
    private func update() {
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.text = String(FruitType.banana.stock)
        pineappleStock.text = String(FruitType.pineapple.stock)
        kiwiStock.text = String(FruitType.kiwi.stock)
        mangoStock.text = String(FruitType.mango.stock)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStock.fruit = FruitType.strawberry
        bananaStock.fruit = FruitType.banana
        pineappleStock.fruit = FruitType.pineapple
        kiwiStock.fruit = FruitType.kiwi
        mangoStock.fruit = FruitType.mango
        
        strawBananaButton.juice = JuiceType.strawBanana
        mangoKiwiButton.juice = JuiceType.mangoKiwi
        strawberryButton.juice = JuiceType.strawberry
        bananaButton.juice = JuiceType.banana
        pineappleButton.juice = JuiceType.pineapple
        kiwiButton.juice = JuiceType.kiwi
        mangoButton.juice = JuiceType.mango
    }
}
