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
            order(juice: .strawberryJuice)
        case 1:
            order(juice: .bananaJuice)
        case 2:
            order(juice: .kiwiJuice)
        case 3:
            order(juice: .pineappleJuice)
        case 4:
            order(juice: .strawberryBananaJuice)
        case 5:
            order(juice: .mangoJuice)
        case 6:
            order(juice: .mangoKiwiJuice)
        default:
            print("unknown")
        }
        updateFruitStockLabel()
    }
    
    func updateFruitStockLabel() {
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            fruitStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[index])
        }
    }
    
    func order(juice: Juice) {
        do {
            try juiceMaker.blendFruitJuice(menu: juice)
            showSucessAlert(message: "\(juice.description)나왔습니다. 맛있게 드세요!")
        } catch JuiceMakerError.outOfFruitStock {
            
        } catch {
            
        }
    }
    
    func showSucessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let sucesssAction = UIAlertAction(title: "닫기", style: .cancel)
        
        
        alert.addAction(sucesssAction)
        present(alert, animated: true, completion: nil)
    }
}

