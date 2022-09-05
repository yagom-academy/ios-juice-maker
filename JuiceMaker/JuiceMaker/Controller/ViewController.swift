//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker: JuiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        // Do any additional setup after loading the view.
    }
    
    func updateStockLabel() {
        updateStrawberryStockLabel()
        updateBananaStockLabel()
        updatePineappleStockLabel()
        updateKiwiStockLabel()
        updateMangoStockLabel()
    }

    func updateStrawberryStockLabel() {
        let strawberryStock = try! juiceMaker.fetchStock(of: .strawberry)
        strawberryStockLabel.text = String(strawberryStock)
    }
    
    func updateBananaStockLabel() {
        let bananaStock = try! juiceMaker.fetchStock(of: .banana)
        bananaStockLabel.text = String(bananaStock)
    }
    
    func updatePineappleStockLabel() {
        let pineappleStock = try! juiceMaker.fetchStock(of: .pineapple)
        pineappleStockLabel.text = String(pineappleStock)
    }
    
    func updateKiwiStockLabel() {
        let kiwiStock = try! juiceMaker.fetchStock(of: .kiwi)
        kiwiStockLabel.text = String(kiwiStock)
    }
    
    func updateMangoStockLabel() {
        let mangoStock = try! juiceMaker.fetchStock(of: .mango)
        mangoStockLabel.text = String(mangoStock)
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        if let orderedJuice = JuiceMaker.Juice(rawValue: sender.tag) {
            do {
                try juiceMaker.produce(juice: orderedJuice)
                showOrderedAlert(juice: orderedJuice)
            } catch JuiceMakerError.outOfStock {
                showOrderFailedAlert()
            } catch {
                print("unexpected error: \(error)")
            }
        }
        updateStockLabel()
    }
    
    func fetchOrderedAlertMessage(juice: JuiceMaker.Juice) -> String {
        switch juice {
        case .strawberryJuice:
            return "딸기쥬스 나왔습니다! 맛있게 드세요!"
        case .bananaJuice:
            return "바나나쥬스 나왔습니다! 맛있게 드세요!"
        case .kiwiJuice:
            return "키위쥬스 나왔습니다! 맛있게 드세요!"
        case .mangoJuice:
            return "망고쥬스 나왔습니다! 맛있게 드세요!"
        case .mangoKiwiJuice:
            return "망키쥬스 나왔습니다! 맛있게 드세요!"
        case .pineappleJuice:
            return "파인애플쥬스 나왔습니다! 맛있게 드세요!"
        case .strawberryBananaJuice:
            return "딸바쥬스 나왔습니다! 맛있게 드세요!"
        }
    }
    
    func showOrderedAlert(juice: JuiceMaker.Juice) {
        let message = fetchOrderedAlertMessage(juice: juice)
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예",
                                     style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showOrderFailedAlert() {
        let message = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예",
                                     style: .default)
        let cancelAction = UIAlertAction(title: "아니요",
                                         style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

