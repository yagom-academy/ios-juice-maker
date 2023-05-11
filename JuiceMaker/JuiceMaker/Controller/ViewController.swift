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
        orderFruitJuice()
    }
    
    func orderFruitJuice() {
        let juiceMaker = JuiceMaker()
        
        do {
            try juiceMaker.blendFruitJuice(menu: .bananaJuice)
            try juiceMaker.blendFruitJuice(menu: .strawberryJuice)
        } catch JuiceMakerError.outOfFruitStock(let fruitJuice) {
            print("\(fruitJuice)의 재료 재고가 부족합니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
}

