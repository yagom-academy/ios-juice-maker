//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        let buttonText = sender.titleLabel?.text
        let juice: Juice
        
        switch buttonText {
        case "딸바쥬스 주문":
            juice = .strawberryBanana
        case "망키쥬스 주문":
            juice = .mangoKiwi
        case "딸기쥬스 주문":
            juice = .strawberry
        case "바나나쥬스 주문":
            juice = .banana
        case "파인애플쥬스 주문":
            juice = .pineapple
        case "키위쥬스 주문":
            juice = .kiwi
        case "망고쥬스 주문":
            juice = .mango
        default:
            notificationAlert(message: "잘못된 접근입니다.")
            return
        }
        
        do {
            try juiceMaker.mixFruit(juice: juice)
        } catch RequestError.fruitStockOut {
            outOfStockAlert()
        } catch let error as RequestError {
            notificationAlert(message: error.errorDescription)
        } catch {
            notificationAlert(message: "잘못된 접근입니다.")
        }
    }
    
    func notificationAlert(message: String, title: String = "OK") {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: title, style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func outOfStockAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreView") else { return }
            self.present(viewController, animated: true, completion: nil)
        }
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
}

