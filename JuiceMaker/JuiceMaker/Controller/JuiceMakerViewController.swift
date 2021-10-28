//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    let notificationCenter: NotificationCenter = .default
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    
    @IBAction func touchUpModifyStockButton(_ sender: UIBarButtonItem) {
        presentModifyStockViewController()
    }
    
    @IBAction private func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let orderedJuice = takeJuiceOrder(from: sender) else {
            return
        }
        
        do {
            try juiceMaker.make(juice: orderedJuice)
            notificationCenter.post(name: .completeMakingJuice, object: nil)
            presentCompleteMakingJuiceAlert(juice: orderedJuice)
        } catch ServiceError.notEnoughStock {
            presentNotEnoughStockAlert()
        } catch SystemError.invaildKey {
            print(SystemError.invaildKey.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func takeJuiceOrder(from button: UIButton) -> JuiceMaker.Juice? {
        switch button {
        case strawberryBananaJuiceOrderButton:
            return .strawberryBananaJuice
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwiJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        default:
            return nil
        }
    }
    
    private func presentCompleteMakingJuiceAlert(juice: JuiceMaker.Juice) {
        let completeAlert = UIAlertController(title: nil, message: "\(juice.description) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        completeAlert.addAction(confirmAction)
        
        self.present(completeAlert, animated: true, completion: nil)
    }
    
    private func presentNotEnoughStockAlert() {
        let notEnoughStockAlert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let modifyStockAction = UIAlertAction(title: "재고 수정", style: .default) { _ in
            self.presentModifyStockViewController()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        notEnoughStockAlert.addAction(cancelAction)
        notEnoughStockAlert.addAction(modifyStockAction)
        
        self.present(notEnoughStockAlert, animated: true, completion: nil)
    }
    
    private func presentModifyStockViewController() {
        let modifyStockStoryboard = UIStoryboard(name: "ModifyStock", bundle: nil)
        let modifyStockViewController = modifyStockStoryboard.instantiateViewController(identifier: "ModifyStockViewController")
        
        self.present(modifyStockViewController, animated: true, completion: nil)
    }
    
    @objc private func updateAllStockLabels() {
        let stockLabels: [UILabel]! = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        
        stockLabels.forEach { stockLabel in
            updateStockLabel(with: stockLabel)
        }
    }
    
    private func updateStockLabel(with label: UILabel) {
        guard let fruit = matchFruit(with: label) else {
            return
        }
        
        guard let currentStockCount = juiceMaker.store.stock[fruit] else {
            return
        }
        
        label.text = String(currentStockCount)
    }
    
    private func matchFruit(with label: UILabel) -> FruitStore.Fruit? {
        switch label {
        case strawberryStockLabel:
            return .strawberry
        case bananaStockLabel:
            return .banana
        case pineappleStockLabel:
            return .pineapple
        case kiwiStockLabel:
            return .kiwi
        case mangoStockLabel:
            return .mango
        default:
            return nil
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllStockLabels()
        notificationCenter.addObserver(self, selector: #selector(updateAllStockLabels), name: .completeMakingJuice, object: nil)
    }
}

extension Notification.Name {
    static let completeMakingJuice = Notification.Name("completeMakingJuice")
}
