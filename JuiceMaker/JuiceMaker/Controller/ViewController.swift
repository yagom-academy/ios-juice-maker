//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let asd = JuiceMaker()
        asd.makeJuice(Juice.strawberryBanana)
        print(FruitStore.shared.fruits)
    }
}

