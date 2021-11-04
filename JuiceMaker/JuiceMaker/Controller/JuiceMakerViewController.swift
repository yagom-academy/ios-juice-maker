//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBananaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
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
        if let storyboard = storyboard {
            let stockManagerViewController = storyboard.instantiateViewController(identifier: "StockManagerViewController") as StockManagerViewController
            stockManagerViewController.juiceMaker = juiceMaker
            present(stockManagerViewController, animated: true, completion: nil)
        }
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
            self.currentStrawberryStockLabel.text = "\(updatedAmount)"
        case .bananna:
            self.currentBananaStockLabel.text = "\(updatedAmount)"
        case .pineapple:
            self.currentPineappleStockLabel.text = "\(updatedAmount)"
        case .kiwi:
            self.currentKiwiStockLabel.text = "\(updatedAmount)"
        case .mango:
            self.currentMangoStockLabel.text = "\(updatedAmount)"
        }
    }
}


