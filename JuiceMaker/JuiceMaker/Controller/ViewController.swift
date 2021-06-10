//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        let value = JuiceMaker()
        
       // value.makeJuice(order: .bananaJuice)
        value.makeJuice(order: .ddalbaJuice)
      
       // print(value.fruitStores[.strawberry, default: .].amount)

    }
}
