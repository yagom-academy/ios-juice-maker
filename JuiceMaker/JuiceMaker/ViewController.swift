//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    
    let test: JuiceMaker = JuiceMaker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(test.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        test.orderMakeJuice(targetJuice: ObjectIdentifier(BananaJuice.self))
        print(test.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))

    }

}

