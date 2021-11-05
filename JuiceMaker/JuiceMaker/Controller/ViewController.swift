//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAllFruitLabel()
        addObserverForStockConsumption()
        addObserverForStockModified()
    }
    
    private func addObserverForStockConsumption() {
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveNotification),
                                       name: Notification.Name.stockInformation,
                                       object: nil)
    }
    
    private func addObserverForStockModified() {
        notificationCenter.addObserver(self,
                                       selector: #selector(updateAllFruitLabel),
                                       name: Notification.Name.stockModified,
                                       object: nil)
    }
    
    @objc private func updateAllFruitLabel() {
        for (fruit, stock) in juiceMaker.stockOfFruit {
            updateFruitLabel(for: fruit, stock: stock)
        }
    }
    
    private func updateFruitLabel(for fruit: Fruit, stock: Int) {
        for label in stockLabels {
            if label.tag == fruit.rawValue {
                label.text = String(stock)
            }
        }
    }
    
    @objc private func didReceiveNotification(_ notification: Notification) {
        let userInfo = notification.userInfo
        
        if let fruit = userInfo?[NotificationKey.fruit] as? Fruit,
           let stock = userInfo?[NotificationKey.stock] as? Int,
           let orderComplete = userInfo?[NotificationKey.orderComplete] as? Bool {
            if orderComplete {
                updateFruitLabel(for: fruit, stock: stock)
                return
            }
            showOrderFailAlert(fruit: fruit)
        }
    }
    
    @IBAction private func tapJuiceOrderButton(_ sender: UIButton) {
        do {
            guard let menu = JuiceMaker.Menu(rawValue: sender.tag) else {
                throw JuiceMakerError.invalidTagNumberForButton
            }
            orderJuice(for: menu)
        } catch JuiceMakerError.invalidTagNumberForButton {
            print(JuiceMakerError.invalidTagNumberForButton.description)
        } catch {
            print(error)
        }
    }
    
    @IBAction private func moveToStockUpdateView(_ sender: UIBarButtonItem) {
        showStockUpdateView()
    }
    
    private func orderJuice(for menu: JuiceMaker.Menu) {
        juiceMaker.orderFruitJuice(juice: menu)
        showOrderSuccessAlert(for: menu)
    }
    
    private func showOrderSuccessAlert(for menu: JuiceMaker.Menu) {
        let message = menu.description + AlertMessage.orderComplete
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        let OrderSuccessAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        OrderSuccessAlert.addAction(okAction)
        present(OrderSuccessAlert, animated: true, completion: nil)
    }
    
    private func showOrderFailAlert(fruit: Fruit) {
        let message = fruit.description + AlertMessage.outOfStock
        let cancelAction = UIAlertAction(title:AlertMessage.cancel, style: .cancel)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default) { _ in
            self.showStockUpdateView()
        }
        let orderFailAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        orderFailAlert.addAction(okAction)
        orderFailAlert.addAction(cancelAction)
        present(orderFailAlert, animated: true, completion: nil)
    }
    
    private func showStockUpdateView() {
        if let stockUpdateController = self.storyboard?.instantiateViewController(withIdentifier: "StockUpdateController") as? StockUpdateController {
            stockUpdateController.stockOfFruit = juiceMaker.stockOfFruit
            let navigationController = UINavigationController(rootViewController: stockUpdateController)
            present(navigationController, animated: true)
        }
    }
}
