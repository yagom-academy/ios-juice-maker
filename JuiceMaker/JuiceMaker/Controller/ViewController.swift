//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var fruitStore = FruitStore(fruitInventory: [.strawberry: 30, .banana: 30, .pineapple: 30, .mango: 30, .kiwi: 30])
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        juiceMaker = JuiceMaker(store: fruitStore)
        
        
    }
}

