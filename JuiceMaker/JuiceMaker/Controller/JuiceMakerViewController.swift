//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    enum JuiceError: Error {
        case invalidJuiceOrder
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAllFruitStockLabels()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showCurrentStockLabel(_:)),
            name: .changedFruitStock,
            object: nil
        )
    }
    
    @objc func showCurrentStockLabel(_ notification: Notification) {
        let fruitStock = notification.object as! FruitStock
        switch fruitStock.fruit {
        case .strawberry:
            self.strawberryStockLabel.text = String(fruitStock.stock)
        case .banana:
            self.bananaStockLabel.text = String(fruitStock.stock)
        case .pineapple:
            self.pineappleStockLabel.text = String(fruitStock.stock)
        case .kiwi:
            self.kiwiStockLabel.text = String(fruitStock.stock)
        case .mango:
            self.mangoStockLabel.text = String(fruitStock.stock)
        }
    }
    
    func initializeAllFruitStockLabels() {
        initializeStockLabel(of: .strawberry, label: strawberryStockLabel)
        initializeStockLabel(of: .banana, label: bananaStockLabel)
        initializeStockLabel(of: .pineapple, label: pineappleStockLabel)
        initializeStockLabel(of: .kiwi, label: kiwiStockLabel)
        initializeStockLabel(of: .mango, label: mangoStockLabel)
    }

    func initializeStockLabel(of fruit: Fruit, label: UILabel) {
        do {
            let currentStock = try fruitStore.showStockLeft(fruit: fruit)
            label.text = String(currentStock)
        } catch FruitStoreError.invalidFruit {
            showNotificationAlert(message: "없는 과일입니다.", actionTitle: "OK")
        } catch {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
        }
    }
    
    func findJuiceMenu(from sender: UIButton) throws -> Juice {
        switch sender {
        case strawberryBananaJuiceButton:
            return .strawberryBananaJuice
        case mangoKiwiJuiceButton:
            return .mangoKiwiJuice
        case strawberryJuiceButton:
            return .strawberryJuice
        case bananaJuiceButton:
            return .bananaJuice
        case pineappleJuiceButton:
            return .pineappleJuice
        case kiwiJuiceButton:
            return .kiwiJuice
        case mangoJuiceButton:
            return .mangoJuice
        default:
            throw JuiceError.invalidJuiceOrder
        }
    }

    @IBAction func juiceButtonTapped(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()

        do {
            let juice = try findJuiceMenu(from: sender)
            try juiceMaker.order(juice: juice)
            showNotificationAlert(message: "\(juice.menu)쥬스 나왔습니다! 맛있게 드세요!", actionTitle: "🥤")
        } catch FruitStoreError.outOfStock {
            showOutOfStockAlert()
        } catch FruitStoreError.invalidFruit {
            showNotificationAlert(message: "없는 과일입니다.", actionTitle: "OK")
        } catch FruitStoreError.stockBelowMinimum {
            showNotificationAlert(message: "과일재고는 음수가 될 수 없습니다.", actionTitle: "OK")
        } catch {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
        }
    }
    
    func showNotificationAlert(message: String, actionTitle: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(
            title: nil,
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "예", style: .default) {
            action in
            self.navigateToFruitStore()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToFruitStore() {
        guard let fruitStoreNavigationController = self.storyboard?.instantiateViewController(
            withIdentifier: "fruitStoreNavigationController"
        ) else {
            showNotificationAlert(message: "알 수 없는 에러가 발생했습니다.", actionTitle: "OK")
            return
        }
        
        self.present(fruitStoreNavigationController, animated: true, completion: nil)
    }
}
