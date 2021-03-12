//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBAction func touchUpStrawBanana(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.strawBanana)
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.text = String(FruitType.banana.stock)
    }
    @IBAction func touchUpMangoKiwi(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.mangoKiwi)
        mangoStock.text = String(FruitType.mango.stock)
        kiwiStock.text = String(FruitType.kiwi.stock)
    }
    
    @IBAction func touchUpStrawberry(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.strawberry)
        strawberryStock.text = String(FruitType.strawberry.stock)
    }
    
    @IBAction func touchUpBanana(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.banana)
        bananaStock.text = String(FruitType.banana.stock)
    }
    
    @IBAction func touchUpPineapple(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.pineapple)
        pineappleStock.text = String(FruitType.pineapple.stock)
    }
    
    @IBAction func touchUpKiwi(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.kiwi)
        kiwiStock.text = String(FruitType.kiwi.stock)
    }
    
    @IBAction func touchUpMango(_ sender: UIButton) {
        JuiceMaker.shared.make(JuiceType.mango)
        mangoStock.text = String(FruitType.mango.stock)
    }
}

