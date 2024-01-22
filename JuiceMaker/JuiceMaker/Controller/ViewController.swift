//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    private var juiceMaker: JuiceMaker?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeJuiceAndHandleResult()
    }
    
    func makeJuiceAndHandleResult() {
        juiceMaker = JuiceMaker()
        let juiceResult = juiceMaker?.makeJuice(juiceName: "딸바쥬스", amount: 1)
        
        if let result = juiceResult {
            print(result)
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}

