//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stockLabel: [UILabel]!
    @IBOutlet var juiceOrderButton: [UIButton]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateFruitStockLabel()
    }
    
    func makeJuice(_ juice: Juice) {
        do {
            try JuiceMaker.common.makeJuice(juice)
            showSuccessAlert(about: juice)
            updateFruitStockLabel(about: juice)
        } catch JuiceMakerError.outOfStock {
            showOutOfStockAlert()
        } catch {
            showMachineErrorAlert()
        }
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: Any) {
        guard let touchedjuiceOrderButton = sender as? UIButton else {
            return showMachineErrorAlert()
        }
        
        let tag = touchedjuiceOrderButton.tag
        guard let selectedJuice = Juice(rawValue: tag) else {
            return showMachineErrorAlert()
        }
        
        makeJuice(selectedJuice)
    }
    
    private func updateFruitStockLabel() {
        for fruitName in JuiceMaker.common.fruits {
            guard let fruit = JuiceMaker.common.fruits[fruitName.key] else {
                return showMachineErrorAlert()
            }
            
            stockLabel[fruitName.key.rawValue].text = String(fruit.amount)
        }
    }
    
    private func updateFruitStockLabel(about juice: Juice) {
        for (neededFruit, _ ) in juice.recipe {
            guard let fruit = JuiceMaker.common.fruits[neededFruit] else {
                return showMachineErrorAlert()
            }
            stockLabel[neededFruit.rawValue].text = String(fruit.amount)
        }
    }
    
    private func moveToManageStockPage() {
        guard let currentStoryboard = self.storyboard else { return }
        
        let stockViewController = currentStoryboard.instantiateViewController(withIdentifier: "StockViewController")
        
        stockViewController.modalPresentationStyle = .fullScreen
        present(stockViewController, animated: true, completion: nil)
    }
    
    private func showSuccessAlert(about juice: Juice) {
        let message = juice.describtion + Message.success.rawValue
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default,
                                     handler: { _ in
                                        self.updateFruitStockLabel(about: juice)
                                     })
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    private func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil, message: Message.outOfStock.rawValue, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "yes", style: .default,
                                      handler: { _ in
                                        self.moveToManageStockPage()
                                      })
        let noButton = UIAlertAction(title: "no", style: .default, handler: nil)
        
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func showMachineErrorAlert() {
        let alert = UIAlertController(title: "ERROR", message: Message.machineError.rawValue, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

