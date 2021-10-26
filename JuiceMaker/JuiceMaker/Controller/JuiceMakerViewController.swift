//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadStocks()
    
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock(notification:)), name: .changedFruitStockNotification, object: nil)
    }
    
    func uploadStocks() {
        currentStockLabel(fruit: .strawberry, label: strawberryStock)
        currentStockLabel(fruit: .banana, label: bananaStock)
        currentStockLabel(fruit: .pineapple, label: pineappleStock)
        currentStockLabel(fruit: .kiwi, label: kiwiStock)
        currentStockLabel(fruit: .mango, label: mangoStock)
    }
    
    
    func currentStockLabel(fruit: FruitStore.Fruit, label: UILabel) {
        do {
            let stock = try FruitStore.shared.stock(fruit: fruit)
            label.text = String(stock)
        } catch let error as RequestError {
            notificationAlert(message: error.errorDescription)
        } catch {
            notificationAlert(message: "알 수 없는 에러가 발생했습니다.")
        }
    }
    
    @objc func updateFruitStock(notification: Notification) {
        // 수정된 과일과 과일의 재고갯수를 받아와서 label을 수정
        guard let fruit = notification.object as? FruitStore.Fruit else {
            notificationAlert(message: "알 수 없는 에러가 발생했습니다.")
            return
        }
        currentStockLabel(fruit: fruit, label: fruitlabel(of: fruit))
    }
    
    func fruitlabel(of fruit: FruitStore.Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStock
        case .banana:
            return bananaStock
        case .pineapple:
            return pineappleStock
        case .kiwi:
            return kiwiStock
        case .mango:
            return mangoStock
        }
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
            notificationAlert(message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!")
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
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreView") else { return }
            self.present(viewController, animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

