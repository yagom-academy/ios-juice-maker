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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateStock()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        do {
            if let targetJuice = Juice(rawValue: sender.tag) {
                try JuiceMaker.juiceMaker.makeJuice(targetJuice)
                updateStock()
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
        vcName.modalTransitionStyle = .coverVertical
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
                let vcName = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController")
                vcName?.modalTransitionStyle = .coverVertical
                self.present(vcName!, animated: true, completion: nil)
            }
            alert.addAction(yesAction)
            alert.addAction(noAction)
        } else {
            let okAction = UIAlertAction(title: DisplayMessage.alertOk, style: .default, handler: nil)
            alert.addAction(okAction)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateStock() {
        strawberryStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .strawberry))
        bananaStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .banana))
        pineAppleStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .pineapple))
        kiwiStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .kiwi))
        mangoStockLabel.text = String(JuiceMaker.juiceMaker.getFruitStore().getStock(fruit: .mango))
    }
}



