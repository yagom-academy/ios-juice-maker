//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    private var juiceMaker: JuiceMaker?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker()
        showJuiceHandleResult()
    }
    
    func showJuiceHandleResult() {
        if let juiceResult = juiceMaker?.makeJuice(juiceMenu: .strawberryBanana, amount: 1) {
            print(juiceResult)
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}

