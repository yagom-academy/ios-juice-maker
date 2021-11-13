//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        initializeJuiceMaker()
    }

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        order(.strawberryBananaJuice)
    }
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        order(.strawberryJuice)
    }
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        order(.bananaJuice)
    }
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        order(.mangoKiwiJuice)
    }
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        order(.pineappleJuice)
    }
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        order(.kiwiJuice)
    }
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        order(.mangoJuice)
    }
    
    @IBAction func presentStockManagerViewController(_ sender: Any?) {
        guard let storyboard = storyboard else { return }
        let stockManagerViewController = storyboard.instantiateViewController(identifier: "StockManagerViewController") as StockManagerViewController
        stockManagerViewController.juiceMaker = juiceMaker
        present(stockManagerViewController, animated: true, completion: nil)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleStockChanges), name: Notification.Name.stockChanged, object: nil)
    }
    
    private func initializeJuiceMaker() {
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
    private func order(_ juice: JuiceMenu) {
        do {
            try juiceMaker.make(juice)
        } catch FruitStoreError.deficientStock {
            AlertManager.presentFailAlert(on: self)
            return
        } catch {
            AlertManager.presentErrorAlert(on: self)
            return
        }
        AlertManager.presentSuccessAlert(of: juice, on: self)
    }
    
    @objc
    private func handleStockChanges(of notification: Notification) {
        let stockChangeData = notification.userInfo as? [Fruit:Int]
        guard let fruit = stockChangeData?.keys.first, let updatedAmount = stockChangeData?[fruit] else {
            return
        }
        updateStockLabel(of: fruit, by: updatedAmount)
    }
    
    private func updateStockLabel(of fruit: Fruit, by updatedAmount: Int) {
        switch fruit {
        case .strawberry:
            self.strawberryStockLabel.text = "\(updatedAmount)"
        case .banana:
            self.bananaStockLabel.text = "\(updatedAmount)"
        case .pineapple:
            self.pineappleStockLabel.text = "\(updatedAmount)"
        case .kiwi:
            self.kiwiStockLabel.text = "\(updatedAmount)"
        case .mango:
            self.mangoStockLabel.text = "\(updatedAmount)"
        }
    }
}


