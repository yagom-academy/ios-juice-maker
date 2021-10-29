//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialStock()
        addObserverForStockUpdate()
    }
    
    func showInitialStock() {
        strawberryLabel.text = String(Fruit.initialValue)
        bananaLabel.text = String(Fruit.initialValue)
        pineappleLabel.text = String(Fruit.initialValue)
        kiwiLabel.text = String(Fruit.initialValue)
        mangoLabel.text = String(Fruit.initialValue)
    }
    
    func addObserverForStockUpdate() {
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveNotification),
                                       name: Notification.Name.stockInformation,
                                       object: nil)
    }
    
    func updateFruitLabel(for fruit: Fruit, stock: Int) {
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(stock)
        case .banana:
            bananaLabel.text = String(stock)
        case .pineapple:
            pineappleLabel.text = String(stock)
        case .kiwi:
            kiwiLabel.text = String(stock)
        case .mango:
            mangoLabel.text = String(stock)
        }
    }
    
    @objc func didReceiveNotification(_ notification: Notification) {
        if let fruit = notification.userInfo?[NotificationKey.fruit] as? Fruit,
           let stock = notification.userInfo?[NotificationKey.stock] as? Int,
           let orderComplete = notification.userInfo?[NotificationKey.orderComplete] as? Bool {
            if orderComplete == true {
                updateFruitLabel(for: fruit, stock: stock)
            } else {
                showOrderFailAlert(fruit: fruit)
            }
        }
    }

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .strawberryBananaJuice)
        showOrderSuccessAlert(for: .strawberryBananaJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .strawberryJuice)
        showOrderSuccessAlert(for: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .bananaJuice)
        showOrderSuccessAlert(for: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .pineappleJuice)
        showOrderSuccessAlert(for: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .kiwiJuice)
        showOrderSuccessAlert(for: .kiwiJuice)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .mangoKiwiJuice)
        showOrderSuccessAlert(for: .mangoKiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .mangoJuice)
        showOrderSuccessAlert(for: .mangoJuice)
    }
    
    func showOrderSuccessAlert(for menu: JuiceMaker.Menu) {
        let message = "\(menu.description) 나왔습니다! 맛있게드세요!"
        let okAction = UIAlertAction(title: "확인", style: .default)
        let OrderSuccessAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        OrderSuccessAlert.addAction(okAction)
        present(OrderSuccessAlert, animated: true, completion: nil)
    }
    
    func showOrderFailAlert(fruit: Fruit) {
        let message = "\(fruit.description)의 재고가 부족합니다. 재고를 수정할까요?"
        let cancelAction = UIAlertAction(title:"취소", style: .cancel)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let stockController = self.storyboard?.instantiateViewController(withIdentifier: "StockUpdateController") {
                self.present(stockController, animated: true)
            }
        }
        let orderFailAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        orderFailAlert.addAction(okAction)
        orderFailAlert.addAction(cancelAction)
        present(orderFailAlert, animated: true, completion: nil)
    }
}
