//
//  JuiceMaker - OrderViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()

    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var moveToStockViewButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }
    
    private func showCurrentStock() {
        Fruit.allCases.forEach { fruit in
            stockLabels[fruit.rawValue].text = juiceMaker.fruitStore.inventory[fruit]?.description
        }
    }
    
    @IBAction func moveToStockViewButtonClicked(_ sender: UIBarButtonItem) {
        self.presentStockViewController()
    }
    
    private func presentStockViewController() {
        guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockViewController") as? StockViewController else {
            return
        }
        stockViewController.delegate = self
        stockViewController.currentStocks = juiceMaker.fruitStore.inventory
        self.present(stockViewController, animated: true, completion: nil)
    }
    
    @IBAction func orderButtonsClicked(_ sender: UIButton) {
        Juice.allCases.forEach { juice in
            guard sender.tag == juice.rawValue else {
                return
            }
            order(juice)
        }
        showCurrentStock()
    }
    
    private func order(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(by: juice.recipe)
            alertOrderCompletion(juice)
        } catch OrderError.outOfStock {
            alertOutOfStock()
        } catch { }
    }
}

// MARK: Alert
extension OrderViewController {
    private func alertOrderCompletion(_ juice: Juice) {
        let alert = UIAlertController(title: Alert.orderSuccess.title, message: "\(juice) \(Alert.orderSuccess.message)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.confirm.title, style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func alertOutOfStock() {
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

protocol StockDeliveryProtocol: AnyObject {
    func update(by currentStock: [Fruit: Int])
}

extension OrderViewController: StockDeliveryProtocol {
    func update(by currentStock: [Fruit: Int]) {
        juiceMaker.fruitStore.inventory = currentStock
        showCurrentStock()
    }
}
