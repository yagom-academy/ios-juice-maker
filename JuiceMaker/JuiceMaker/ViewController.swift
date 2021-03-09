//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var testJuiceMaker = JuiceMaker()
        
        print("현재 딸기 재고량 : \(testJuiceMaker.readFruitStock(fruit: strawberry))")
        testJuiceMaker.makeFruitJuice(juice: strawbaJuice)
        print("현재 딸기 재고량 : \(testJuiceMaker.readFruitStock(fruit: strawberry))")
        print("현재 바나나 재고량 : \(testJuiceMaker.readFruitStock(fruit: banana))")
        testJuiceMaker.makeFruitJuice(juice: strawbaJuice)
        print("현재 딸기 재고량 : \(testJuiceMaker.readFruitStock(fruit: strawberry))")
        print("현재 바나나 재고량 : \(testJuiceMaker.readFruitStock(fruit: banana))")
        
    }


}

