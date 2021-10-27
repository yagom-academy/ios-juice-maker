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
    
    let juiceMaker = JuiceMaker()
    
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
        let order = sender.currentTitle?.components(separatedBy: " ").first ?? ""
        
        let juice = Juice(rawValue: order)
        do {
            try juiceMaker.make(juice: juice)
            changeStockLabel()
            showMadeJuiceAlert(juice: order)
        } catch {
            print(error)
        }
    }
    
    func showMadeJuiceAlert(juice: String) {
        let alert = UIAlertController(title: "쥬스 완성", message: "\(juice) 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let close = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
}

