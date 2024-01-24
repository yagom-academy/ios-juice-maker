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
    
    func makeJuice() -> String? {
        let juiceResult = juiceMaker?.makeJuice(juiceMenu: .strawberryBanana, amount: 1)
        return juiceResult
    }
    
    func showJuiceHandleResult() {
        if let result = makeJuice() {
            print(result)
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}

