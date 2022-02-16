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
        
        // TEST
        let jucieMaker = JuiceMaker()
        print(jucieMaker.makeJuice(juice: .strawberryJuice).description)
        print(jucieMaker.makeJuice(juice: .strawberryBananaJuice).description)
    }
}
