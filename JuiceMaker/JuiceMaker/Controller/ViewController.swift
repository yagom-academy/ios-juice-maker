//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        let juiceMaker = JuiceMaker(fruitStore: fruitStore)
        let testJuice = JuiceMenu.strawberryJuice
        var juice: JuiceMenu?
        do {
            juice = try juiceMaker.make(juice: testJuice)
        } catch FruitStoreError.insufficientFruits(unavailableFruits: let unavailableFruits) {
            print("\(unavailableFruits) 재료 부족")
        } catch {
            print("알 수 없는 오류")
        }
        if let juice = juice {
            print(juice.recipe.ingredients)
        }
        
        // Do any additional setup after loading the view.
    }


}

