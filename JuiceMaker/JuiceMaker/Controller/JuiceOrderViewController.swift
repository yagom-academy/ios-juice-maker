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
        guard let pushStockChangeViewController = self.storyboard?.instantiateViewController(
            withIdentifier: "stockChangeViewController"
        ) else {
            return
        }
        
        self.navigationController?.pushViewController(
            pushStockChangeViewController,
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
            showCompletionAlert(for: juice)
        } catch FruitStoreError.insufficientFruit {
            showFailureAlert()
        } catch {
            showErrorAlert()
        }
    }
    
    func showCompletionAlert(for juice: Juice) {
        let juiceCompletionAlert = UIAlertController(
            title: nil,
            message: "\(juice.name)가 나왔습니다! 맛있게 드세요!",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let closeAction = UIAlertAction(
            title: "닫기",
            style: UIAlertAction.Style.default
        )
        
        juiceCompletionAlert.addAction(closeAction)
        present(juiceCompletionAlert, animated: true, completion: nil)
    }
    
    func showFailureAlert() {
        let juiceFailureAlert = UIAlertController(
            title: nil,
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let stockChangeAction = UIAlertAction(
            title: "예",
            style: UIAlertAction.Style.destructive
        ) { _ in
            self.didTapStockChangeButton(self.stockChangeButton)
        }
        
        let closeAction = UIAlertAction(
            title: "아니오",
            style: UIAlertAction.Style.cancel
        )
        
        juiceFailureAlert.addAction(stockChangeAction)
        juiceFailureAlert.addAction(closeAction)
        present(juiceFailureAlert, animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(
            title: nil,
            message: "알 수 없는 에러가 발생하였습니다. \n 다시 시도해주시기 바랍니다.",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let closeAction = UIAlertAction(
            title: "닫기",
            style: UIAlertAction.Style.default
        )
        
        errorAlert.addAction(closeAction)
        present(errorAlert, animated: true, completion: nil)
    }
}
