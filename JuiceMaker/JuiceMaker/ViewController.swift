//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juicemaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock : UILabel!
    @IBOutlet weak var pineappleStock : UILabel!
    @IBOutlet weak var kiwiStock : UILabel!
    @IBOutlet weak var mangoStock : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nowStocks()
//        print(String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self))))
    }

    func nowStocks() {
        strawberryStock.text = String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self)))
        bananaStock.text = String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        pineappleStock.text = String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Pineapple.self)))
        kiwiStock.text = String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Kiwi.self)))
        mangoStock.text = String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Mango.self)))
    }
}

