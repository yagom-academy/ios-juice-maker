//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var juiceOrderButtons: [UIButton]!
    @IBOutlet weak var stockManagerButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showCurrentStock()
    }

    func showCurrentStock() {
        juiceMaker.fruitStore.inventory.keys.forEach {
            switch $0 {
            case .strawberry:
                stockLabels[0].text = transformTypeToString(.strawberry)
            case .banana:
                stockLabels[1].text = transformTypeToString(.banana)
            case .pineapple:
                stockLabels[2].text = transformTypeToString(.pineapple)
            case .kiwi:
                stockLabels[3].text = transformTypeToString(.kiwi)
            default:
                stockLabels[4].text = transformTypeToString(.mango)
            }
        }
    }
    
    func transformTypeToString(_ fruit: Fruit) -> String? {
        guard let currentStock = juiceMaker.fruitStore.inventory[fruit] else {
            return nil
        }
        return String(currentStock)
    }
    
    @IBAction func stockManagerButtonClicked(_ sender: UIBarButtonItem) {
        self.presentStockViewController()
    }
    
    func presentStockViewController() {
        guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockViewController") as? StockViewController else {
            return
        }
        stockViewController.modalTransitionStyle = .coverVertical
        stockViewController.modalPresentationStyle = .fullScreen
        self.present(stockViewController, animated: true, completion: nil)
    }

    @IBAction func juiceOrderButtonCollection(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            order(.strawberryBananaJuice)
            showCurrentStock()
        case 2:
            order(.mangoKiwiJuice)
            showCurrentStock()
        case 3:
            order(.strawberryJuice)
            showCurrentStock()
        case 4:
            order(.bananaJuice)
            showCurrentStock()
        case 5:
            order(.pineappleJuice)
            showCurrentStock()
        case 6:
            order(.kiwiJuice)
            showCurrentStock()
        default:
            order(.mangoJuice)
            showCurrentStock()
        }
    }
    
    func order(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(by: juice.recipe)
            alertOrderCompletion(juice)
        } catch OrderError.outOfStock {
            alertOutOfStock()
        } catch { }
    }
    
    func alertOrderCompletion(_ juice: Juice) {
        let alert = UIAlertController(title: Alert.orderSuccess.title, message: "\(juice.hangeulName) \(Alert.orderSuccess.message)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.confirm.title, style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    func alertOutOfStock() {
        let alert = UIAlertController(title: Alert.outOfStock.title, message: Alert.outOfStock.message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.yes.title, style: .default) { action in
            self.presentStockViewController()
        }
        let cancelAction = UIAlertAction(title: AlertButton.no.title, style: .destructive, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

