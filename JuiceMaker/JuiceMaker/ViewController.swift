//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var test = JuiceMaker()
        var juice: Juice = .strawbaJuice
        
        
        test.makeJuice(juiceName: juice)
        print(test.messeges)
        print(test.nowStock(index: 0))
        print(test.nowStock(index: 1))
        test.makeJuice(juiceName: juice)
        print(test.messeges)
        print(test.nowStock(index: 0))
        print(test.nowStock(index: 1))
    }
    
    
    


}

