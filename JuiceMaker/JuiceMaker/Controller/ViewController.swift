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
        
        // juiceResult를 이용하여 쥬스 제조 결과를 처리
        if let result = juiceResult {
            print(result) // 또는 다른 작업 수행
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}

