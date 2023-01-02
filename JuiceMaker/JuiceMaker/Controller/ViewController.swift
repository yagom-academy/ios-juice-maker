//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let juiceMaker: JuiceMaker = JuiceMaker()

        do {
            try juiceMaker.makeJuice(juice: .strawberryJuice)
            
        } catch JuiceMakerError.insufficientStock {
            print("재고 부족")
        } catch {
            print(error)
        }
        
        
    }


}

