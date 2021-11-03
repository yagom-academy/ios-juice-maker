//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBananaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        initializeJuiceMaker()
    }

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        order(.strawberryBananaJuice)
    }
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        order(.strawberryJuice)
    }
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        order(.bananaJuice)
    }
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        order(.mangoKiwiJuice)
    }
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        order(.pineappleJuice)
    }
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        order(.kiwiJuice)
    }
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        order(.mangoJuice)
    }
    
    @IBAction func presentStockManagerViewController(_ sender: Any?) {
        if let storyboard = storyboard {
            let stockManagerViewController = storyboard.instantiateViewController(identifier: "StockManagerViewController")
            present(stockManagerViewController, animated: true, completion: nil)
        }
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleStockChanges), name: Notification.Name.stockChanged, object: nil)
    }
    
    private func initializeJuiceMaker() {
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
    private func order(_ juice: JuiceMenu) {
        do {
            try juiceMaker.make(juice)
        } catch FruitStoreError.deficientStock {
            presentFailAlert()
            return
        } catch {
            presentErrorAlert()
            return
        }
        presentSuccessAlert(of: juice)
    }
    
    private func presentFailAlert() {
        let failAlert = UIAlertController(title: "\(AlertTitle.fail)", message: "\(AlertMessage.fail)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "\(AlertButtonTitle.ok)", style: .default, handler: { _ in
            self.presentStockManagerViewController(nil)
        })
        let cancel = UIAlertAction(title: "\(AlertButtonTitle.cancel)", style: .cancel, handler: nil)
        failAlert.addAction(ok)
        failAlert.addAction(cancel)
        failAlert.preferredAction = ok
        self.present(failAlert, animated: true, completion: nil)
    }
    
    private func presentErrorAlert() {
        let errorAlert = UIAlertController(title: "\(AlertTitle.error)", message: "\(AlertMessage.error)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "\(AlertButtonTitle.ok)", style: .default, handler: nil)
        errorAlert.addAction(ok)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    private func presentSuccessAlert(of juice: JuiceMenu) {
        let successAlert = UIAlertController(title: "\(juice) \(AlertTitle.success)", message: "\(AlertMessage.success)", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "\(AlertButtonTitle.confirm)", style: .default, handler: nil))
        self.present(successAlert, animated: true, completion: nil)
    }
    
    @objc
    private func handleStockChanges(of notification: Notification) {
        let stockChangeData = notification.userInfo as? [Fruit:Int]
        guard let fruit = stockChangeData?.keys.first, let updatedAmount = stockChangeData?[fruit] else {
            return
        }
        updateStockLabel(of: fruit, by: updatedAmount)
    }
    
    private func updateStockLabel(of fruit: Fruit, by updatedAmount: Int) {
        switch fruit {
        case .strawberry:
            self.currentStrawberryStockLabel.text = "\(updatedAmount)"
        case .bananna:
            self.currentBananaStockLabel.text = "\(updatedAmount)"
        case .pineapple:
            self.currentPineappleStockLabel.text = "\(updatedAmount)"
        case .kiwi:
            self.currentKiwiStockLabel.text = "\(updatedAmount)"
        case .mango:
            self.currentMangoStockLabel.text = "\(updatedAmount)"
        }
    }
}

extension JuiceMakerViewController {
    enum AlertTitle: String, CustomStringConvertible {
        case success = "나왔습니다"
        case fail = "재료가 모자라요"
        case error = "오류가 발생했어요🥲"
    
        var description: String {
            rawValue
        }
    }
    enum AlertMessage: String, CustomStringConvertible {
        case success = "맛있게 드세요!"
        case fail = "재고를 수정할까요?"
        case error = "다시 시도해주세요"
        
        var description: String {
            return rawValue
        }
    }
    enum AlertButtonTitle: String, CustomStringConvertible {
        case cancel = "취소"
        case ok = "확인"
        case confirm = "잘 먹겠습니다🤤"
        
        var description: String {
            return rawValue
        }
    }
}


