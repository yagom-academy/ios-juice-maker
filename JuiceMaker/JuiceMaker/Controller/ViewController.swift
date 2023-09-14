//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try JuiceMaker().takeOrder(order: .strawberryBananaJuice)
        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }


}

