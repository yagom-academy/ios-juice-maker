//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet var fruitStockLabels: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("프린트0")
        case 1:
            print("프린트1")
        case 2:
            print("프린트2")
        case 3:
            print("프린트3")
        case 4:
            print("프린트4")
        case 5:
            print("프린트5")
        case 6:
            print("프린트6")
        default:
            print("-----")
        }
    }
    
    func updateFruitStockLabel() {
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            print(fruitStockLabel.tag)
            fruitStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[index])
        }
    }
}

