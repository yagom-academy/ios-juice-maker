//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore(fruit: [.strawberry: 10,
                                        .banana: 10,
                                        .pineapple: 10,
                                        .kiwi: 10,
                                        .mango: 10])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
