//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var strawberryStock: StockLabel!
    //FIXME: 여기서 @IBOutlet var strawberryStock: StockLabel! = StockLabel(FruitType.strawberry)를 해줘도 왜 속성값이 안바뀌어 있을까?..
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
            present(successAlert(), animated: true, completion: nil)
            //FIXME: 왜 여기다 update() 쓰면 처음 버튼 눌렀을때는 update안되고 다음번 버튼 눌렀을 때 이전턴걸로 update가 될까???
        } else {
            present(failAlert(), animated: true, completion: nil)
        }
        JuiceMaker.shared.make(sender.juice)
        update()
    }
    func update() {
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.text = String(FruitType.banana.stock)
        pineappleStock.text = String(FruitType.pineapple.stock)
        kiwiStock.text = String(FruitType.kiwi.stock)
        mangoStock.text = String(FruitType.mango.stock)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //strawberryStock = StockLabel(FruitType.strawberry)
        //bananaStock = StockLabel(FruitType.banana)
        //FIXME: 왜 위에처럼 하면 안되고 밑에처럼 하면 될까?..
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
