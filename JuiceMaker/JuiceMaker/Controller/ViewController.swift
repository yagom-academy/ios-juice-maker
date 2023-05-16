//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFruitStockLabel()
    }

    func setFruitStockLabel() {
        do {
            strawberryStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .strawberry))
            bananaStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .banana))
            pineappleStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .pineapple))
            kiwiStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .kiwi))
            mangoStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .mango))
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
}

