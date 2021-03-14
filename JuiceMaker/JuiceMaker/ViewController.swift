//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var strawberryStock: StockLabel!
    @IBOutlet var bananaStock: StockLabel!
    //FIXME: 이곳에서 @IBOutlet var bananaStock: StockLabel! = StockLabel(FruitType.banana)를 작성하면 버튼을 누를 시점에 속성값이 바뀌어있지 않습니다. (디폴트 속성값인 strawberry로 되어있었습니다.)
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
            //FIXME: 이곳에서 update()를 호출하면 처음 버튼을 눌렀을때는 update가 되지 않고 다음번 버튼을 눌렀을 때 이전 턴의 결과로 update가 이루어집니다.
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
