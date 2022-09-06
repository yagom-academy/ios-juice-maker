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
        
        updateAllStockLabels()
    }
    
    func updateAllStockLabels() {
        Fruit.allCases.forEach({ fruit in
            updateStockLabel(of: fruit)
        })
    }
    
    func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = try? juiceMaker.fetchStock(of: fruit) else { return }
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(fruitStock)
        case .banana:
            bananaStockLabel.text = String(fruitStock)
        case .pineapple:
            pineappleStockLabel.text = String(fruitStock)
        case .kiwi:
            kiwiStockLabel.text = String(fruitStock)
        case .mango:
            mangoStockLabel.text = String(fruitStock)
        }
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
        updateAllStockLabels()
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
                                     style: .default) { action in
            self.presentStockEditViewController()
        }
        let cancelAction = UIAlertAction(title: "아니요",
                                         style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func presentStockEditViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stockEditVC = storyboard.instantiateViewController(identifier: "stockEditNavigation")
        
        stockEditVC.modalPresentationStyle = .fullScreen
        
        present(stockEditVC, animated: true, completion: nil)
    }
}

