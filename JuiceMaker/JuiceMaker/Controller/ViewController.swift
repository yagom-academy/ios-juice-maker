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
		let fruitStore = FruitStore(baseStock: 10)
		var juiceMaker = JuiceMaker(fruitStore: fruitStore)
		juiceMaker.makeFruitJuice(menu: .kiwiJuice)
		juiceMaker.makeFruitJuice(menu: .kiwiJuice)
		juiceMaker.makeFruitJuice(menu: .kiwiJuice)
        juiceMaker.makeFruitJuice(menu: .kiwiJuice)
    }
}

