//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFristView()
    }

    @IBAction func clickStock(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "StockViewController") {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            orderJuice(to: .strawberryJuice)
        case 2:
            orderJuice(to: .bananaJuice)
        case 3:
            orderJuice(to: .pineappleJuice)
        case 4:
            orderJuice(to: .kiwiJuice)
        case 5:
            orderJuice(to: .mangoJuice)
        case 6:
            orderJuice(to: .strawberryBananaJuice)
        case 7:
            orderJuice(to: .mangoKiwiJuice)
        default:
            break
        }
        
        configureFristView()
    }
    
    func configureFristView() {
        let stock = juiceMaker.fruitStore.fruitStock.compactMapValues { stock in
            return String(stock)
        }
        
        strawberryLabel.text = stock[.strawberry]
        bananaLabel.text = stock[.banana]
        kiwiLabel.text = stock[.kiwi]
        pineappleLabel.text = stock[.pineapple]
        mangoLabel.text = stock[.mango]
    }
    
    func orderJuice(to juice: Juice) {
        do {
            try juiceMaker.createJuice(juice: juice)
            announceJuiceReady(message: "\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        } catch FruitStoreError.outOfStock {
            alertLowInventory(message: "재료가 모자라요. 재고를 수정할까요?")
        } catch {
            print(error)
        }
    }
    
    func announceJuiceReady(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(checkAction)
        present(alert, animated: true, completion: nil)
    }
    
    func alertLowInventory(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        let okAction = UIAlertAction(title: "예", style: .default) { action in
            if let viewController = self.storyboard?.instantiateViewController(identifier: "StockViewController") {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}

