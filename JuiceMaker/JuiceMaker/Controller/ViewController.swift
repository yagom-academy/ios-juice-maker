//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let juiceMaker: JuiceMakerProtocol = JuiceMaker()
        juiceMaker.chooseJuice(juice: .mangoKiwiJuice)
        
        let juiceMaker2 = JuiceMaker()
        juiceMaker2.chooseJuice(juice: .pineappleJuice)
    }
}

