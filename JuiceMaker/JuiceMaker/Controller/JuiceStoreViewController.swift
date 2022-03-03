//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabels()
    }
    
    private func updateFruitStockLabels() {
        strawberryCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .pineapple)
        kiwiCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
    
    private func convertToJuice(_ sender: UIButton) -> Juice? {
        switch sender.tag {
            case 1:
                return .strawberryBanana
            case 2:
                return .strawberry
            case 3:
                return .banana
            case 4:
                return .pineapple
            case 5:
                return .kiwi
            case 6:
                return .mango
            case 7:
                return .mangoKiwi
            default:
                return nil
            }
        }
    
    @IBAction private func orderJuices(_ sender: UIButton) {
        guard let juice = convertToJuice(sender) else { return }
        juiceMaker.makeJuice(juice) ? showSuccessAlert(of: juice) : showFailureAlert()
        updateFruitStockLabels()
    }
    
    @IBAction private func moveEditFruitStockViewController(_ sender: Any) {
        guard let fruitStockEditViewController = self.storyboard?.instantiateViewController(withIdentifier: FruitStockEditViewController.identifier()) else { return }
        present(fruitStockEditViewController, animated: true, completion: nil)
    }
    
    private func showSuccessAlert(of juice: Juice) {
        let alert = AlertMessage.self
        let successAlert = UIAlertController(title: juice.name+alert.cameOut.description,
                                             message: alert.enjoyDrink.description,
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: alert.check.description,
                                     style: .default,
                                     handler: nil)
        successAlert.addAction(okAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    private func showFailureAlert() {
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
