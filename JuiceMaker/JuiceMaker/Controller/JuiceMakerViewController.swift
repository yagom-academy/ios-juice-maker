//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBanannaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        initializeJuiceMaker()
    }
    
    @IBAction func pressOrderButton(_ sender: UIButton) {
        let juice = JuiceMenu.allCases[sender.tag]
        order(juice)
    }
    
    @IBAction func presentStockManagerVC(_ sender: Any?) {
        let stockManagerVC = storyboard?.instantiateViewController(withIdentifier: "StockManagerVC") as! StockManagerViewController
   
        present(stockManagerVC, animated: true, completion: nil)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleStockChanges),
                                               name: Notification.Name.stockChanged,
                                               object: nil)
    }
    
    private func initializeJuiceMaker() {
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
    private func order(_ juice: JuiceMenu) {
        do {
            try juiceMaker?.make(juice)
        } catch FruitStoreError.deficientStock {
            presentFailAlert()
        } catch {
            presentErrorAlert()
        }
        
        presentSuccessAlert(of: juice)
    }
    
    private func presentFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.presentStockManagerVC(nil)
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        failAlert.addAction(ok)
        failAlert.addAction(cancel)
        failAlert.preferredAction = ok
        
        self.present(failAlert, animated: true, completion: nil)
    }
    
    private func presentErrorAlert() {
        let errorAlert = UIAlertController(title: "오류가 발생했어요🥲", message: "다시 시도해주세요", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        errorAlert.addAction(ok)
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    private func presentSuccessAlert(of juice: JuiceMenu) {
        let successAlert = UIAlertController(title: "\(juice) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "잘 먹겠습니다🤤", style: .default, handler: nil))
        
        self.present(successAlert, animated: true, completion: nil)
    }
    
    @objc
    private func handleStockChanges(of notification: Notification) {
        let dic = notification.userInfo as? [Fruit:Int]
        guard let fruit = dic?.keys.first, let updatedAmount = dic?[fruit] else {
            return
        }
        
//        guard let updatedAmount = notification.userInfo?[fruit] as? Int else {
//            return
//        }
        
        updateStockLabel(of: fruit, by: updatedAmount)
    }
    
    private func updateStockLabel(of fruit: Fruit, by updatedAmount: Int) {
        switch fruit {
        case .strawberry:
            self.currentStrawberryStockLabel.text = "\(updatedAmount)"
        case .bananna:
            self.currentBanannaStockLabel.text = "\(updatedAmount)"
        case .pineapple:
            self.currentPineappleStockLabel.text = "\(updatedAmount)"
        case .kiwi:
            self.currentKiwiStockLabel.text = "\(updatedAmount)"
        case .mango:
            self.currentMangoStockLabel.text = "\(updatedAmount)"
        }
    }
}

extension Notification.Name {
    static let stockChanged = Notification.Name(rawValue: "stockChanged")
}
