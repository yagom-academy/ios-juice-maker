//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    func printFruitLabel() {
        let stock = juiceMaker.fruitStore
        strawberryStockLabel.text = String(stock[.strawberry]?.amount ?? 0)
        bananaStockLabel.text = String(stock[.banana]?.amount ?? 0)
        pineappleStockLabel.text = String(stock[.banana]?.amount ?? 0)
        kiwiStockLabel.text = String(stock[.banana]?.amount ?? 0)
        mangoStockLabel.text = String(stock[.banana]?.amount ?? 0)
    }
    
    func succeededMakingJuiceAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,
                                     style: . default) { (action) in
            self.juiceMaker.makeJuice(order: .bananaJuice)
            print("hi")
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        succeededMakingJuiceAlert(message: "바나나 쥬스 나왔습니다! 맛있게 드세요!")
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        printFruitLabel()
    }
}
