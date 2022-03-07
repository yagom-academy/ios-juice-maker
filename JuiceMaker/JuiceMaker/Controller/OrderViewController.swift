//
//  JuiceMaker - OrderViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
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
        changeButtonCornerRadius()
        showCurrentStock()
    }
    
    private func changeButtonCornerRadius() {
        self.strawberryBananaJuiceOrderButton.layer.cornerRadius = 16
        self.mangoKiwiJuiceOrderButton.layer.cornerRadius = 16
        self.strawberryJuiceOrderButton.layer.cornerRadius = 16
        self.bananaJuiceOrderButton.layer.cornerRadius = 16
        self.pineappleJuiceOrderButton.layer.cornerRadius = 16
        self.kiwiJuiceOrderButton.layer.cornerRadius = 16
        self.mangoJuiceOrderButton.layer.cornerRadius = 16
    }
    
    private func showCurrentStock() {
        juiceMaker.fruitStore.inventory.keys.forEach {
            switch $0 {
            case .strawberry:
                strawberryStockLabel.text = juiceMaker.fruitStore.inventory[.strawberry]?.description
            case .banana:
                bananaStockLabel.text = juiceMaker.fruitStore.inventory[.banana]?.description
            case .pineapple:
                pineappleStockLabel.text = juiceMaker.fruitStore.inventory[.pineapple]?.description
            case .kiwi:
                kiwiStockLabel.text = juiceMaker.fruitStore.inventory[.kiwi]?.description
            case .mango:
                mangoStockLabel.text = juiceMaker.fruitStore.inventory[.mango]?.description
            }
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
        stockViewController.changedStock = juiceMaker.fruitStore.inventory
        self.present(stockViewController, animated: true, completion: nil)
    }

    @IBAction func orderButtonsClicked(_ sender: UIButton) {
        if sender == strawberryBananaJuiceOrderButton {
            order(.strawberryBananaJuice)
        
        } else if sender == mangoKiwiJuiceOrderButton {
            order(.mangoKiwiJuice)
        
        } else if sender == strawberryJuiceOrderButton {
            order(.strawberryJuice)

        } else if sender == bananaJuiceOrderButton {
            order(.bananaJuice)

        } else if sender == pineappleJuiceOrderButton {
            order(.pineappleJuice)
            
        } else if sender == kiwiJuiceOrderButton {
            order(.kiwiJuice)
            
        } else {
            order(.mangoJuice)
            
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

protocol StockDeliveryProtocol: NSObjectProtocol {
    func updateStock(_ changedStock: [Fruit: Int])
}

extension OrderViewController: StockDeliveryProtocol {
    func updateStock(_ changedStock: [Fruit : Int]) {
        juiceMaker.fruitStore.inventory = changedStock
        showCurrentStock()
    }
}
