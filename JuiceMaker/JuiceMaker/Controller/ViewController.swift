//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    lazy var fruitLabel: [Fruit : UILabel] = [.strawberry : strawberryStockLabel,
                                              .banana : bananaStockLabel,
                                              .pineapple : pineappleStockLabel,
                                              .kiwi : kiwiStockLabel,
                                              .mango : mangoStockLabel]

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setFruitStockLabel()
        setNotification()
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabel), name: Notification.Name.stock, object: nil)
        juiceMaker.addNotficationObserver()
    }
    
    @objc func updateStockLabel(noti: Notification) {
        guard let changeFruitStock = noti.userInfo as? [Fruit : Int] else {
            return
        }
        
        for (key, value) in changeFruitStock {
            self.fruitLabel[key]?.text = String(value)
        }
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        guard let modifyStockVC = storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as? ModifyStockViewController else {
            return
        }
        
        modifyStockVC.fruitStock = juiceMaker.fruitStore.fruitStock
        let moveToStockNC = UINavigationController(rootViewController: modifyStockVC)
        present(moveToStockNC, animated: true, completion: nil)
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard var orderedJuice = sender.currentTitle else {
            return
        }
        
        orderedJuice = orderedJuice.replacingOccurrences(of: " 주문", with: "")
        guard let juice = Juice(rawValue: orderedJuice) else {
            return
        }
                
        let isMadeJuice =  juiceMaker.manufactureJuice(menu: juice)
        guard isMadeJuice else {
            showFailedAlert(message: ConstantSentence.failedAlertMent)
            return
        }
        
        showSuccessAlert(message: juice.rawValue + ConstantSentence.successAlertMent)
        setFruitStockLabel()
    }

    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
    
    func showFailedAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
            guard let modifyStockVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as? ModifyStockViewController else {
                return
            }
            
            modifyStockVC.fruitStock = self.juiceMaker.fruitStore.fruitStock
            let moveToStockNC = UINavigationController(rootViewController: modifyStockVC)
            self.present(moveToStockNC, animated: true, completion: nil)
        }
        
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.mainTitle
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    func setFruitStockLabel() {
        let fruitStore = juiceMaker.fruitStore
        for (key, value) in fruitLabel {
            value.text = String(fruitStore.bringValidFruitStock(key))
        }
    }
}
