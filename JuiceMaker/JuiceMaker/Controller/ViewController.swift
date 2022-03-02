//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineAppleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       updateStock()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        do {
            guard let targetJuice = Juice(rawValue: sender.tag) else {
                makeAlert(error: JuiceMakingError.unkownError)
                return
            }
            try JuiceMaker.juiceMaker.makeJuice(targetJuice)
            updateStock()
            makeAlert(juice: targetJuice)
        } catch {
            if let juiceMakingError = error as? JuiceMakingError{
                makeAlert(error: juiceMakingError)
            } else {
                makeAlert(error: JuiceMakingError.unkownError)
            }
        }
    }
    
    @IBAction func moveToStockView(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController")
        vcName?.modalTransitionStyle = .coverVertical
        self.present(vcName!, animated: true, completion: nil)
    }
    
    func makeAlert(juice: Juice) {
        let title = DisplayMessage.successAlertTitle
        let okAction = UIAlertAction(title: DisplayMessage.alertOk, style: .default, handler: nil)
        let message = Juice.getJuiceName(juice: juice) + DisplayMessage.orderSuccess
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func makeAlert(error: JuiceMakingError) {
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



