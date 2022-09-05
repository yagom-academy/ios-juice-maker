//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myJuiceMaker = JuiceMaker()
        myJuiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        myJuiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        
    }

}

