//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockLable: UILabel!
    @IBOutlet weak var bananaStockLable: UILabel!
    @IBOutlet weak var pineappleStockLable: UILabel!
    @IBOutlet weak var kiwiStockLable: UILabel!
    @IBOutlet weak var mangoStockLable: UILabel!
    
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    func showGetYourJuiceAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpMakeStrawberryJuiceButton(_ sender: UIButton) {
        
        let strawberryJuice = juiceMaker.makeJuice(order: Juice.strawberryJuice)
        guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry] else {
            return
        }
        strawberryStockLable.text = String(stockOfStrawberry)
    }
    
    @IBAction func touchUpMakeBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.makeJuice(order: Juice.bananaJuice)
        guard let stockOfBanana = FruitStorage.shared.refrigerator[.banana]
        else {
            return
        }
        bananaStockLable.text = String(stockOfBanana)
        print(stockOfBanana)
    }
    
    @IBAction func touchUpMakepineappleJuiceButton(_ sender: UIButton) {
        juiceMaker.makeJuice(order: Juice.pineappleJuice)
        guard let stockOfPineapple = FruitStorage.shared.refrigerator[.pineapple]
        else {
            return
        }
        pineappleStockLable.text = String(stockOfPineapple)
    }
}
