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
        
        let j = JuiceMaker()
        print(j.checkStock(fruit: .strawberry))
        j.addStock(fruit: .strawberry)
        print(j.checkStock(fruit: .strawberry))
        
        
    }
}

