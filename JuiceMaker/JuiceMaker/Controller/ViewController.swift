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
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStock.text = juiceMaker.fruitStore.checkFruitsStock(name: .strawberry)
        bananaStock.text = juiceMaker.fruitStore.checkFruitsStock(name: .banana)
        pineappleStock.text = juiceMaker.fruitStore.checkFruitsStock(name: .pineapple)
        kiwiStock.text = juiceMaker.fruitStore.checkFruitsStock(name: .kiwi)
        mangoStock.text = juiceMaker.fruitStore.checkFruitsStock(name: .mango)
    }

    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderPineapplerJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
    }
    
}

