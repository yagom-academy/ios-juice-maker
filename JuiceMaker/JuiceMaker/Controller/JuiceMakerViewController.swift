//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    @IBOutlet private weak var strawberryCount: UILabel!
    @IBOutlet private weak var bananaCount: UILabel!
    @IBOutlet private weak var pineappleCount: UILabel!
    @IBOutlet private weak var kiwiCount: UILabel!
    @IBOutlet private weak var mangoCount: UILabel!
    
    private let juiceMaker = JuiceMaker()
    private var fruitLabelDictionary: [Fruit: UILabel] = [:]
    
    private func initFruitLabelDictionary() {
        fruitLabelDictionary[.strawberry] = strawberryCount
        fruitLabelDictionary[.banana] = bananaCount
        fruitLabelDictionary[.pineapple] = pineappleCount
        fruitLabelDictionary[.kiwi] = kiwiCount
        fruitLabelDictionary[.mango] = mangoCount
    }
    
    @objc private func refreshStock(_ noti: NSNotification) {
        for (fruit, label) in fruitLabelDictionary {
            guard let fruitStock = juiceMaker.fruitStore.fruitList[fruit] else {
                return
            }
            
            label.text = String(fruitStock)
        }
    }
    
    private func failureAlert() {
        let alert = UIAlertController(title: AlertTitle.lackIngredient.rawValue, message: AlertMessage.updateStock.rawValue, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: AlertTitle.yes.rawValue, style: .default) { action in
            self.presentFruitStore()
        })
        alert.addAction(UIAlertAction(title: AlertTitle.no.rawValue, style: .default, handler: nil))
    
        present(alert, animated: true, completion: nil)
    }
    
    private func completeAlert(menu: Menu) {
        let alert = UIAlertController(title: "\(menu.explainKorean) \(AlertTitle.served.rawValue)", message: AlertMessage.enjoy.rawValue, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: AlertTitle.yes.rawValue, style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentFruitStore() {
        guard let FruitStoreViewController = storyboard?.instantiateViewController(identifier: String(describing: FruitStoreViewController.self)) else {
            return
        }
        
        FruitStoreViewController.modalPresentationStyle = .pageSheet
        FruitStoreViewController.modalTransitionStyle = .coverVertical
        
        present(FruitStoreViewController, animated: true)
    }
    
    @IBAction private func touchUpInsideOrderButton(_ sender: UIButton) {
        guard let menu = Menu(rawValue: sender.tag) else {
            return
        }
        
        do {
            try juiceMaker.takeOrder(order: menu)
            completeAlert(menu: menu)
        } catch {
            failureAlert()
        }
    }
    
    @IBAction private func touchUpInsidePresentFruitStore() {
        presentFruitStore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruitLabelDictionary()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshStock(_:)), name: Notification.Name(OccurNotification.refreshStock.rawValue), object: nil)
        NotificationCenter.default.post(name: Notification.Name(OccurNotification.refreshStock.rawValue), object: nil)
    }
}
