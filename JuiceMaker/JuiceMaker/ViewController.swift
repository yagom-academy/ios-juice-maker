//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
        juiceMaker.makeJuice(menu: .strawberryJuice)
        juiceMaker.makeJuice(menu: .strawberryAndBananaJuice)
    }


}

