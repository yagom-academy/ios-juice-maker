//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineAppleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        strawberryStockLabel.text = String(FruitStore.fruitStore.getStock(fruit: .strawberry))
        bananaStockLabel.text = String(FruitStore.fruitStore.getStock(fruit: .banana))
        pineAppleStockLabel.text = String(FruitStore.fruitStore.getStock(fruit: .pineapple))
        kiwiStockLabel.text = String(FruitStore.fruitStore.getStock(fruit: .kiwi))
        mangoStockLabel.text = String(FruitStore.fruitStore.getStock(fruit: .mango))
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        if let buttonTitle = sender.titleLabel?.text {
            print(buttonTitle)
        }
        let alert = UIAlertController(title: "쥬스 제조 성공!",
                                   message: "쥬스 나왔습니다 맛있게 드세요.",
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

