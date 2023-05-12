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
        let juiceMaker = JuiceMaker()
        juiceMaker.blendFruitJuice(menu: .bananaJuice)
        juiceMaker.blendFruitJuice(menu: .strawberryJuice)
    }
}

