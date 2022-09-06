//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designateFruitStock()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayFruitStock(_:)),
                                               name: NSNotification.Name("stockChanged"),
                                               object: nil)
    }
    
    let juiceMaker = JuiceMaker()
    
    func designateFruitStock() {
        let fruitStock = juiceMaker.fruitStorage.updateFruitStock()
        guard let strawberry = fruitStock[.strawberry],
              let banana = fruitStock[.banana],
              let pineapple = fruitStock[.pineapple],
              let kiwi = fruitStock[.kiwi],
              let mango = fruitStock[.mango] else {
            return
        }
        
        self.strawberryStockLabel.text = "\(strawberry)"
        self.bananaStockLabel.text = "\(banana)"
        self.pineappleStockLabel.text = "\(pineapple)"
        self.kiwiStockLabel.text = "\(kiwi)"
        self.mangoStockLabel.text = "\(mango)"
    }
    
    @objc func displayFruitStock(_ notification: Notification) {
        guard let stock = notification.userInfo?["stockChanged"] as? Dictionary<Fruit, Int> else {
            return
        }
        
        self.strawberryStockLabel.text = "\(stock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(stock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(stock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(stock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(stock[.mango] ?? 0)"
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        
        switch sender {
        case strawberryBananaJuiceButton:
            juiceMaker.makeJuice(to: .strawberryBananaJuice)
        case mangoKiwiJuiceButton:
            juiceMaker.makeJuice(to: .mangoKiwiJuice)
        case strawberryJuiceButton:
            juiceMaker.makeJuice(to: .strawberryJuice)
        case bananaJuiceButton:
            juiceMaker.makeJuice(to: .bananaJuice)
        case pineappleJuiceButton:
            juiceMaker.makeJuice(to: .pineappleJuice)
        case kiwiJuiceButton:
            juiceMaker.makeJuice(to: .kiwiJuice)
        case mangoJuiceButton:
            juiceMaker.makeJuice(to: .mangoJuice)
        default:
            print("버튼을 다시 눌러주세요.")
        }
    }

}

