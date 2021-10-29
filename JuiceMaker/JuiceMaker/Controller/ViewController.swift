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
    
    @IBAction func tapJuiceOrderButton(_ sender: UIButton) {
        do {
            let menu = try switchTagNumberToMenu(tag: sender.tag)
            makeJuice(for: menu)
        } catch {
            print(error)
        }
    }
    
    func switchTagNumberToMenu(tag: Int) throws -> JuiceMaker.Menu {
        switch tag {
        case 0:
            return JuiceMaker.Menu.strawberryJuice
        case 1:
            return JuiceMaker.Menu.bananaJuice
        case 2:
            return JuiceMaker.Menu.pineappleJuice
        case 3:
            return JuiceMaker.Menu.kiwiJuice
        case 4:
            return JuiceMaker.Menu.mangoJuice
        case 5:
            return JuiceMaker.Menu.strawberryBananaJuice
        case 6:
            return JuiceMaker.Menu.mangoKiwiJuice
        default:
            throw JuiceMakerError.invalidTagNumberForButton
        }
    }
    
    func makeJuice(for menu: JuiceMaker.Menu) {
        juiceMaker.makeFruitJuice(juice: menu)
        showOrderSuccessAlert(for: menu)
    }
    
    func showOrderSuccessAlert(for menu: JuiceMaker.Menu) {
        let message = menu.description + AlertMessage.orderComplete
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        let OrderSuccessAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        OrderSuccessAlert.addAction(okAction)
        present(OrderSuccessAlert, animated: true, completion: nil)
    }
    
    func showOrderFailAlert(fruit: Fruit) {
        let message = fruit.description + AlertMessage.outOfStock
        let cancelAction = UIAlertAction(title:AlertMessage.cancel, style: .cancel)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default) { _ in
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
