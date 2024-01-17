//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum JuiceMenu: Int {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

enum FruitCategory: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case mango = "망고"
}

class ViewController: UIViewController {

    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

