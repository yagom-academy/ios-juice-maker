//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {

    // MARK: - Property
    
    var juiceMaker: JuiceMaker
    
    // MARK: - Initialize

    required init?(coder: NSCoder) {
        print(#function)
        juiceMaker = JuiceMaker(fruitStore: FruitStore())
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

