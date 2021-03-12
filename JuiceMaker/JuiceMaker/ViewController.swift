//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit
class JuiceButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        juiceName = JuiceType.strawberry
        super.init(coder: aDecoder)!
    }
    init(juice: Juice) {
        juiceName = juice
        super.init(frame: .zero)
    }
    var juiceName: Juice
}

class StockLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    init(fruit: Fruit) {
        fruitName = fruit
        super.init(frame: .zero)
    }
    var fruitName: Fruit = FruitType.strawberry
}

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet var strawberryStock :StockLabel? = StockLabel(fruit: FruitType.strawberry)
    @IBOutlet var bananaStock :StockLabel? = StockLabel(fruit: FruitType.banana)
    @IBOutlet var pineappleStock :StockLabel? = StockLabel(fruit: FruitType.pineapple)
    @IBOutlet var kiwiStock :StockLabel? = StockLabel(fruit: FruitType.kiwi)
    @IBOutlet var mangoStock :StockLabel? = StockLabel(fruit: FruitType.mango)
    
   
    @IBOutlet var strawBananaButton: JuiceButton? = JuiceButton(juice: JuiceType.strawBanana)

    @IBOutlet var mangoKiwi: JuiceButton? = JuiceButton(juice: JuiceType.mangoKiwi)
    @IBOutlet var strawberryButton: JuiceButton? = JuiceButton(juice: JuiceType.strawberry)
    @IBOutlet var bananaButton: JuiceButton? = JuiceButton(juice: JuiceType.banana)
    @IBOutlet var pineappleButton: JuiceButton? = JuiceButton(juice: JuiceType.pineapple)
    @IBOutlet var kiwiButton: JuiceButton? = JuiceButton(juice: JuiceType.kiwi)
    @IBOutlet var mangoButton: JuiceButton? = JuiceButton(juice: JuiceType.mango)
    
    @IBAction func touchUpJuiceButton(_ sender: JuiceButton) {
        JuiceMaker().make(menu: sender.juiceName)
        strawberryStock?.text = String(FruitType.strawberry.stock)
        bananaStock?.text = String(FruitType.banana.stock)
        pineappleStock?.text = String(FruitType.pineapple.stock)
        kiwiStock?.text = String(FruitType.kiwi.stock)
        mangoStock?.text = String(FruitType.mango.stock)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

