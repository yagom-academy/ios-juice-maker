//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var strawberryStock :UILabel!
    @IBOutlet weak var bananaStock :UILabel!
    @IBOutlet weak var pineappleStock :UILabel!
    @IBOutlet weak var kiwiStock :UILabel!
    @IBOutlet weak var mangoStock :UILabel!
    
    
    @IBAction func touchUpJuiceButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        
    }
    
    @IBAction func touchUpStrawberryJuice() {
        juiceMaker.makeJuice(juice: JuiceType.strawberryJuice)
        strawberryStock.text = String(FruitType.strawberry.stock)
    }
    @IBAction func touchUpBananaJuice() {
        juiceMaker.makeJuice(juice: JuiceType.bananaJuice)
        bananaStock.text = String(FruitType.banana.stock)
    }
    @IBAction func touchUpPineappleJuice() {
        juiceMaker.makeJuice(juice: JuiceType.pineappleJuice)
        pineappleStock.text = String(FruitType.pineapple.stock)
    }
    @IBAction func touchUpKiwiJuice() {
        juiceMaker.makeJuice(juice: JuiceType.kiwiJuice)
        kiwiStock.text = String(FruitType.kiwi.stock)
    }
    @IBAction func touchUpMangoJuice() {
        juiceMaker.makeJuice(juice: JuiceType.mangoJuice)
        mangoStock.text = String(FruitType.mango.stock)
    }
    @IBAction func touchUpStrawBananaJuice() {
        juiceMaker.makeJuice(juice: JuiceType.strawBananaJuice)
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.text = String(FruitType.banana.stock)
    }
    @IBAction func touchUpMangoKiwiJuice() {
        juiceMaker.makeJuice(juice: JuiceType.mangoKiwiJuice)
        mangoStock.text = String(FruitType.mango.stock)
        kiwiStock.text = String(FruitType.kiwi.stock)
    }
}
