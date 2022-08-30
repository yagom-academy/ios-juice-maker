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
        
        let myJuiceMaker = JuiceMaker()
        print(myJuiceMaker.fruitStore.fruitStock)
        myJuiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        print(myJuiceMaker.fruitStore.fruitStock)

        myJuiceMaker.makeJuice(.mangoKiwiJuice, total: 2)
        print(myJuiceMaker.fruitStore.fruitStock)
        
        myJuiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        print(myJuiceMaker.fruitStore.fruitStock)

    }


}

