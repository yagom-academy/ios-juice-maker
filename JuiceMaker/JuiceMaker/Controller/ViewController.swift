//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {

    private var juiceMaker: JuiceMaker?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        JuiceHandleResult()
    }
    
    func makeJuice() -> String? {
        let juiceResult = juiceMaker?.makeJuice(juiceName: "딸바쥬스", amount: 1)
        return juiceResult
    }
    
    func JuiceHandleResult() {
        if let result = makeJuice() {
            print(result)
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}

