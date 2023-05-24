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
        guard let nextStockChangeViewController = storyboard?.instantiateViewController(
            identifier: "StockChangeViewController"
        ) as? StockChangeViewController else {
            return
        }
        
        configureStockLabel()
        nextStockChangeViewController.strawberryStock = strawberryStockLabel.text ?? ""
        nextStockChangeViewController.bananaStock = bananaStockLabel.text ?? ""
        nextStockChangeViewController.pineappleStock = pineappleStockLabel.text ?? ""
        nextStockChangeViewController.mangoStock = mangoStockLabel.text ?? ""
        nextStockChangeViewController.kiwiStock = kiwiStockLabel.text ?? ""
        
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
            showAlert(.completion(juice))
        } catch FruitStoreError.insufficientFruit {
            showAlert(.failure)
        } catch {
            showAlert(.error)
        }
    }
    
    func showAlert(_ result: JuiceOrderResult) {
        let alert = UIAlertController(
            title: nil,
            message: result.message,
            preferredStyle: UIAlertController.Style.alert
        )
        
        let closeAction = UIAlertAction(
            title: result.closeActionTitle,
            style: UIAlertAction.Style.default
        )
        
        if result == .failure {
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
