//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    enum UserChoice: String {
        case orderStrawberryJuice = "딸기쥬스 주문"
        case orderBananaJuice = "바나나쥬스 주문"
        case orderKiwiJuice = "키위쥬스 주문"
        case orderPineappleJuice = "파인애플쥬스 주문"
        case orderMangoJuice = "망고쥬스 주문"
        case orderDdalbaJuice = "딸바쥬스 주문"
        case orderMangKiJuice = "망키쥬스 주문"
    }
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printStock()
    }
    
    func printStock() {
        let fruitStoreInventory = juiceMaker.fetchStock()
        strawberryQuantityLabel.text = String(fruitStoreInventory[.strawberry] ?? 0)
        bananaQuantityLabel.text = String(fruitStoreInventory[.banana] ?? 0)
        pineappleQuantityLabel.text = String(fruitStoreInventory[.pineapple] ?? 0)
        kiwiQuantityLabel.text = String(fruitStoreInventory[.kiwi] ?? 0)
        mangoQuantityLabel.text = String(fruitStoreInventory[.mango] ?? 0)
    }
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let selectedOrder = sender.titleLabel?.text,
              let order: UserChoice = UserChoice(rawValue: selectedOrder) else {
            return
        }
        
        let orderedJuice = fetchMenu(of: order)
        
        if juiceMaker.make(orderedJuice) {
            showSuccessAlert(menu: orderedJuice)
        } else {
            showFailureAlert()
        }
    }
    
    func fetchMenu(of selectedOrder: UserChoice) -> JuiceMenu {
        switch selectedOrder {
        case .orderStrawberryJuice:
            return .strawberryJuice
        case .orderBananaJuice:
            return .bananaJuice
        case .orderKiwiJuice:
            return .kiwiJuice
        case .orderMangoJuice:
            return .mangoJuice
        case .orderPineappleJuice:
            return .pineappleJuice
        case .orderDdalbaJuice:
            return .ddalbaJuice
        case .orderMangKiJuice:
            return .mangKiJuice
       }
    }
    
    func showSuccessAlert(menu: JuiceMenu) {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: menu.rawValue + AlertMessage.makeSuccessMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인",
                                                    style: .default,
                                                    handler: { (action) in
                                                                     self.printStock()
                                                    })
        alert.addAction(okAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showFailureAlert() {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: AlertMessage.makeFailMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "수정하기",
                                                    style: .default,
                                                    handler: { (action) in
                                                                   self.changeSceneOfManageStockViewController()
                                                    })
        let cancelAction: UIAlertAction = UIAlertAction(title: "나중에 하기",
                                                        style: .default,
                                                        handler: { (action) in
                                                                       self.printStock()
                                                        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func changeSceneOfManageStockViewController() {
        guard let manageStockViewController = self.storyboard?.instantiateViewController(identifier: "manageStock") else {
            return
        }
        self.present(manageStockViewController, animated: true)
    }
}

