//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class HomeViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    var transferStock = [Fruit: Int]()
    
    @IBOutlet private var fruitStockLabel: [FruitStockLabel]!
    
    @IBOutlet private weak var strawberryAndBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoAndKiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    
    private var orderButton: [UIButton] {
        return [strawberryJuiceOrderButton,
                mangoAndKiwiJuiceOrderButton,
                strawberryAndBananaJuiceOrderButton,
                bananaJuiceOrderButton,
                pineappleJuiceOrderButton,
                kiwiJuiceOrderButton,
                mangoJuiceOrderButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getFruitStock), name: .notifyStock, object: nil)
        
        updateFruitStockLabel(stock: juiceMaker.notifyFruitStock())
        
        orderButton.forEach { orderButton in
            orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
        }
    }
    
    @objc dynamic private func getFruitStock(notification: Notification) {
        guard let fruitsStock = notification.userInfo?["stock"] as? [Fruit: Int]
        else {
            return
        }
        updateFruitStockLabel(stock: fruitsStock)
    }
    
    private func updateFruitStockLabel(stock: [Fruit: Int]) {
        fruitStockLabel.forEach { label in
            guard let fruit = label.convertToFruit() else { return }
            guard let fruitLabel = stock[fruit] else { return }
            
            label.text = "\(fruitLabel)"
        }
        transferStock = stock
    }
    
    @objc private func order(_ sender: UIButton) {
        do {
            let juice = try convertToJuice(from: sender)
            try juiceMaker.make(menu: juice)
            showCompletionAlert(menu: juice)
        } catch JuiceMakerError.lackOfStock {
            showLackOfStockAlert()
        } catch {
            print(error)
        }
    }
    
    private func convertToJuice(from button: UIButton) throws -> Menu {
        switch button {
        case strawberryAndBananaJuiceOrderButton:
            return .strawberryAndBananaJuice
        case mangoAndKiwiJuiceOrderButton:
            return .mangoAndKiwiJuice
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.noneExistMenu
        }
    }
    
    private func showLackOfStockAlert() {
        let lackOfStockAlert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noAlert = UIAlertAction(title: "아니오", style: .default, handler: nil)
        let okAlert = UIAlertAction(title: "예", style: .default) { _ in
            self.presentEditStockViewController()
        }
        
        lackOfStockAlert.addAction(noAlert)
        lackOfStockAlert.addAction(okAlert)
        
        present(lackOfStockAlert, animated: true)
    }
    
    private func showCompletionAlert(menu: Menu) {
        let completionAlert = UIAlertController(title: "알림", message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        completionAlert.addAction(okAlert)
        
        present(completionAlert, animated: true)
    }
    
    private func presentEditStockViewController() {
        guard let editStockVC = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") as? EditStockViewController
        else {
            return
        }
        editStockVC.delegate = self
        editStockVC.fruitStock = transferStock
        self.present(editStockVC, animated: true)
    }

    @IBAction private func tabEditStock(_ sender: UIBarButtonItem) {
        self.presentEditStockViewController()
    }
}

extension HomeViewController: DeliverFruitStockDelegate {
    func transferFruit(stock: [Fruit : Int]) {
        juiceMaker.store.fillStock(fruit: stock)
    }
}
