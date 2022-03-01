//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockCountLabel()
    }
    
    func updateFruitStockCountLabel() {
        strawberryCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .pineapple)
        kiwiCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
    
    func convertToJuice(_ sender: UIButton) -> Juice {
        if sender == strawberryBananaJuiceButton {
            return .strawberryBanana
        } else if sender == mangoKiwiJuiceButton {
            return .mangoKiwi
        } else if sender == strawberryJuiceButton {
            return .strawberry
        } else if sender == bananaJuiceButton {
            return .banana
        } else if sender == pineappleJuiceButton {
            return .pineapple
        } else if sender == kiwiJuiceButton {
            return .kiwi
        }
        return .mango
    }
    
    @IBAction func orderJuices(_ sender: UIButton) {
        let juice = convertToJuice(sender)
        juiceMaker.makeJuice(juice) ? showSuccesAlert() : showFailureAlert()
        updateFruitStockCountLabel()
    }
    
    @IBAction func moveEditFruitStockViewController(_ sender: Any) {
        guard let editFruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: EditFruitStockViewController.identifier()) else { return }
        self.present(editFruitStockViewController, animated: true, completion: nil)
    }
    
    func showSuccesAlert() {
        let successAlert = UIAlertController(title: AlertMessage.cameOut.description,
                                             message: AlertMessage.enjoyDrink.description,
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.check.description,
                                     style: .default,
                                     handler: nil)
        successAlert.addAction(okAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    func showFailureAlert() {
        let failureAlert = UIAlertController(title: AlertMessage.outOfStock.description,
                                             message: AlertMessage.editStock.description,
                                             preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.yes.description,
                                     style: .default) { action in
            self.moveEditFruitStockViewController(action)
        }
                                     
        let noAction = UIAlertAction(title: AlertMessage.no.description,
                                     style: .destructive,
                                     handler: nil)
        failureAlert.addAction(okAction)
        failureAlert.addAction(noAction)
        present(failureAlert, animated: true, completion: nil)
    }
}
