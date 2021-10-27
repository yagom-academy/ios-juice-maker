//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeStockLabel()
    }

    func changeStockLabel() {
        strawberryStockLabel.text =  FruitStore.shared.showStock(of: .strawberry)
        bananaStockLabel.text =  FruitStore.shared.showStock(of: .banana)
        pineappleStockLabel.text =  FruitStore.shared.showStock(of: .pineapple)
        kiwiStockLabel.text =  FruitStore.shared.showStock(of: .kiwi)
        mangoStockLabel.text =  FruitStore.shared.showStock(of: .mango)
    }
    
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle
        
        switch buttonTitle {
        case "딸바쥬스 주문":
            print("딸바쥬스")
        case "망키쥬스 주문":
            print("망키쥬스")
        case "바나나쥬스 주문":
            print("바나나쥬스")
        case "파인애플쥬스 주문":
            print("파인애플쥬스")
        case "키위쥬스 주문":
            print("키위쥬스")
        case "망고쥬스 주문":
            print("망고쥬스")
        case "딸기쥬스 주문":
            print("딸기쥬스")
        default:
            return
        }
        
        
        
        
    }
    
    
}

