//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    @IBOutlet private weak var stockChangeButton: UIBarButtonItem!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStockLabel()
    }
    
    func configureStockLabel() {
        let fruitInventory = juiceMaker.readFruitInventory()
        
        guard let strawberryStock = fruitInventory[.strawberry],
              let bananaStock = fruitInventory[.banana],
              let pineappleStock = fruitInventory[.pineapple],
              let mangoStock = fruitInventory[.mango],
              let kiwiStock = fruitInventory[.kiwi]
        else {
            return
        }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        mangoStockLabel.text = String(mangoStock)
        kiwiStockLabel.text = String(kiwiStock)
    }
    
    @IBAction func didTapStockChangeButton(_ sender: UIBarButtonItem) {
        guard let nextStockChangeViewController = self.storyboard?.instantiateViewController(
            identifier: "stockChangeViewController"
        ) else {
            return
        }
        
        self.present(
            nextStockChangeViewController,
            animated: true
        )
    }
    
    @IBAction func didTapOrderButton(_ sender: UIButton) {
        let juice: Juice
        
        switch sender {
        case strawberryJuiceButton:
            juice = .strawberryJuice
        case bananaJuiceButton:
            juice = .bananaJuice
        case pineappleJuiceButton:
            juice = .pineappleJuice
        case mangoJuiceButton:
            juice = .mangoJuice
        case kiwiJuiceButton:
            juice = .kiwiJuice
        case strawberryBananaJuiceButton:
            juice = .strawberryBananaJuice
        case mangoKiwiJuiceButton:
            juice = .mangoKiwiJuice
        default:
            return
        }
        
        order(juice)
    }
    
    func order(_ juice: Juice) {
        do {
            try juiceMaker.takeOrder(juice)
            configureStockLabel()
            showAlert(.completion, juice)
        } catch FruitStoreError.insufficientFruit {
            showAlert(.failure, juice)
        } catch {
            showAlert(.error, juice)
        }
    }
    
    func showAlert(_ resultAlert: ResultAlert, _ juice: Juice) {
        var alert: UIAlertController
        
        let closeAction = UIAlertAction(
            title: resultAlert.closeActionTitle,
            style: UIAlertAction.Style.default
        )
        
        if resultAlert == .completion {
            alert = UIAlertController(
                title: nil,
                message: "\(juice.name) \(resultAlert.message)",
                preferredStyle: UIAlertController.Style.alert
            )
        } else {
            alert = UIAlertController(
                title: nil,
                message: resultAlert.message,
                preferredStyle: UIAlertController.Style.alert
            )
        }
        
        if resultAlert == .failure {
            let stockChangeAction = UIAlertAction(
                title: "예",
                style: UIAlertAction.Style.destructive
            ) { _ in
                self.didTapStockChangeButton(self.stockChangeButton)
            }
            alert.addAction(stockChangeAction)
        }
        
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
}
