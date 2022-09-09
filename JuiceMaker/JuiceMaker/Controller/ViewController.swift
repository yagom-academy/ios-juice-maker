//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    private let juiceMaker: JuiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .systemGray5
        updateAllStockLabels()
    }
    
    private func updateAllStockLabels() {
        Fruit.allCases.forEach({ fruit in
            updateStockLabel(of: fruit)
        })
    }
    
    private func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = try? juiceMaker.fetchStock(of: fruit) else { return }
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(fruitStock)
        case .banana:
            bananaStockLabel.text = String(fruitStock)
        case .pineapple:
            pineappleStockLabel.text = String(fruitStock)
        case .kiwi:
            kiwiStockLabel.text = String(fruitStock)
        case .mango:
            mangoStockLabel.text = String(fruitStock)
        }
    }
    
    @IBAction func juiceOrderButtonPressed(_ sender: UIButton) {
        if let orderedJuice = JuiceMaker.Juice(rawValue: sender.tag) {
            do {
                try juiceMaker.produce(juice: orderedJuice)
                showOrderSucceedAlert(juice: orderedJuice)
                orderedJuice.recipe.ingredient.keys.forEach({ fruit in
                    updateStockLabel(of: fruit)
                })
            } catch JuiceMakerError.outOfStock {
                showOrderFailedAlert(juice: orderedJuice)
            } catch {
                print("unexpected error: \(error)")
            }
        }
    }
    
    private func showOrderSucceedAlert(juice: JuiceMaker.Juice) {
        let message = juice.orderSucceedMessage
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예",
                                     style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showOrderFailedAlert(juice: JuiceMaker.Juice) {
        let message = juice.orderFailedMessage
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예",
                                     style: .default) { action in
            self.presentStockEditViewController()
        }
        let cancelAction = UIAlertAction(title: "아니요",
                                         style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func presentStockEditViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stockEditVC = storyboard.instantiateViewController(identifier: "stockEditNavigation")
        
        present(stockEditVC, animated: true, completion: nil)
    }
    
    @IBAction func stockEditButtonPressed() {
        presentStockEditViewController()
    }
}

