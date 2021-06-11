//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    func refreshStockLabel() {
        let stocks = FruitStore.fruitStore.lookUpStocks()
        for (fruit, quantity) in stocks {
            switch fruit {
            case .strawberry:
                strawberryStockLabel?.text = "\(quantity)"
            case .banana:
                bananaStockLabel?.text = "\(quantity)"
            case .pineapple:
                pineappleStockLabel?.text = "\(quantity)"
            case .kiwi:
                kiwiStockLabel?.text = "\(quantity)"
            case .mango:
                mangoStockLabel?.text = "\(quantity)"
            }
        }
    }
    
    func orderJuice(recipe: Recipe) {
        guard juiceMaker.canMakeJuice(recipe: recipe) else {
            showAlert(message: Message.outOfStock.rawValue, okAction: moveToAddStockView(), cancelAction: cancelAction)
            return
        }
        refreshStockLabel()
        showAlert(message: Message.orderSuccess.rawValue, okAction: okAction, cancelAction: nil)
    }
    
    @IBAction func orderDdalbaJuice(_ sender: UIButton) {
        orderJuice(recipe: .ddalbaJuice)
    }
    
    @IBAction func orderMangkiJuice(_ sender: UIButton) {
        orderJuice(recipe: .mangoKiwiJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        orderJuice(recipe: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        orderJuice(recipe: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        orderJuice(recipe: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        orderJuice(recipe: .kiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        orderJuice(recipe: .mangoJuice)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshStockLabel()
    }
    
    func showOrderSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네!", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

