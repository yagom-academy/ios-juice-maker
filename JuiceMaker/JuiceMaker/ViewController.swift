//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var jucieMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
        jucieMaker.checkFruitStock()
    }


}

