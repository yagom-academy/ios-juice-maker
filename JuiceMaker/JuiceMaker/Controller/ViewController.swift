//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController, JuiceMakerViewDelegate {
    var juiceMaker = JuiceMaker(fruitStore: FruitStore(fruits: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let juiceMakerView = self.view as? JuiceMakerView else {
            return
        }
        
        juiceMakerView.delegate = self
    }
    
    func juiceMakerViewStockEditButtonSelected(_ view: JuiceMakerView) {
        guard let fillStockViewController = self.storyboard?.instantiateViewController(identifier: "FillStockViewController") else {
            return
        }
        
        self.present(fillStockViewController, animated: true, completion: nil)
    }
}

