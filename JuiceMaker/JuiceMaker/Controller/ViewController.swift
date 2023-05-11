//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore(stock: [.strawberry: 20,
                                            .banana: 10,
                                            .pineapple: 15,
                                            .kiwi: 5,
                                            .mango: 7])
		var juiceMaker = JuiceMaker(fruitStore: fruitStore)
		juiceMaker.makeFruitJuice(menu: .kiwiJuice)
		juiceMaker.makeFruitJuice(menu: .kiwiJuice)
    }
}

