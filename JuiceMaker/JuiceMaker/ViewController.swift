//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker(initialStock: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
        juiceMaker.checkFruitStock()
        juiceMaker.makeJuiceUseOneFruit(fruit: .strawberry, requiredNumber: 16)
        juiceMaker.checkFruitStock()
    }


}

