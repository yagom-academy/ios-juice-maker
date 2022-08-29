//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = JuiceMaker()
        a.makeFruitJuice(fruit: FruitJuice.strawberryJuice)
        print(a.juiceList[FruitJuice.strawberryJuice])
    }


}

