//
//  JuiceMaker - ViewController.swift
//  Created by 우롱차, vayne.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class JuiceMakeController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineAppleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    let juiceMaker = JuiceMaker(fruitStore: FruitStore.fruitStore)
    let fruitStore = FruitStore.fruitStore
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadStockToLabel()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        do {
            if let targetJuice = Juice(rawValue: sender.tag) {
                try juiceMaker.makeJuice(targetJuice)
                loadStockToLabel()
                showAlert(juice: targetJuice)
            } else {
                showAlert(error: JuiceMakingError.unkownError)
            }
        } catch {
            showAlert(error: error as? JuiceMakingError ?? JuiceMakingError.unkownError)
        }
    }
    
    @IBAction func moveToStockView(_ sender: UIButton) {
        guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") else {
            return
        }
        //vcName.modalTransitionStyle = .coverVertical
        self.present(vcName, animated: true, completion: nil)
    }
    
    func showAlert(juice: Juice) {
        let title = DisplayMessage.successAlertTitle
        let okAction = UIAlertAction(title: DisplayMessage.alertOk, style: .default, handler: nil)
        let message = Juice.getJuiceName(juice: juice) + DisplayMessage.orderSuccess
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(error: JuiceMakingError) {
        let title = DisplayMessage.failAlertTitle
        let message = JuiceMakingError.getErrorMessage(error: error)
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        if error == JuiceMakingError.notEnoughStock {
            let noAction = UIAlertAction(title: DisplayMessage.alertNo, style: .default, handler: nil)
            let yesAction = UIAlertAction(title: DisplayMessage.alertYes,
                                          style: UIAlertAction.Style.destructive){(_) in
                
                guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") else {
                    return
                }
                vcName.modalPresentationStyle = .fullScreen
                self.present(vcName, animated: true, completion: nil)
            }
            alert.addAction(yesAction)
            alert.addAction(noAction)
        } else {
            let okAction = UIAlertAction(title: DisplayMessage.alertOk, style: .default, handler: nil)
            alert.addAction(okAction)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func loadStockToLabel() {
        let strawberryStock = fruitStore.getStock(fruit: .strawberry)
        let bananaStock = fruitStore.getStock(fruit: .banana)
        let pineappleStock = fruitStore.getStock(fruit: .pineapple)
        let kiwiappleStock = fruitStore.getStock(fruit: .kiwi)
        let mangoStock = fruitStore.getStock(fruit: .mango)
        strawberryStockLabel.text = "\(strawberryStock)"
        bananaStockLabel.text = "\(bananaStock)"
        pineAppleStockLabel.text = "\(pineappleStock)"
        kiwiStockLabel.text = "\(kiwiappleStock)"
        mangoStockLabel.text = "\(mangoStock)"
    }
}



