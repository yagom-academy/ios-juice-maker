//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker(sameInitialStock: 20, strawberryStock: nil, bananaStock: nil, pineappleStock: nil, kiwiStock: nil, mangoStock: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
        juiceMaker.checkFruitStock()
        juiceMaker.makeJuiceUseOneKind(fruit: .strawberry, requiredNumber: 16)
        juiceMaker.checkFruitStock()
    }


}

