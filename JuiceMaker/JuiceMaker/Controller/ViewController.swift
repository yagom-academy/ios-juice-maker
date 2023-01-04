//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let juiceMaker = JuiceMaker()
        
        juiceMaker.makeJuice(.strawberryBananaJuice)
        
        print(juiceMaker.fruitStore.stock)
        
        juiceMaker.makeJuice(.strawberryBananaJuice)
        
        print(juiceMaker.fruitStore.stock)
    }
}

