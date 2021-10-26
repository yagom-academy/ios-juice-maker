//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    let notificantionCenter: NotificationCenter = .default
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let orderedJuice = try? takeJuiceOrder(from: sender) else {
            return
        }
        
        do {
            try juiceMaker.make(juice: orderedJuice)
            notificantionCenter.post(name: .completeMakingJuice, object: nil)
            presentCompleteMakingJuiceAlert(juice: orderedJuice)
        } catch ServiceError.notEnoughStock {
            presentNotEnoughStockAlert()
        } catch SystemError.invaildKey {
            print(SystemError.invaildKey.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func matchFruit(with label: UILabel) throws -> FruitStore.Fruit {
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
            throw SystemError.invaildLabel
        }
    }
    
    func updateStockLabel(with label: UILabel) {
        guard let fruit = try? matchFruit(with: label) else {
            return
        }
        
        guard let currentStockCount = juiceMaker.store.stock[fruit] else {
            return
        }
        
        label.text = String(currentStockCount)
    }
    
    @objc func updateAllStockLabels() {
        let stockLabels: [UILabel]! = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        
        for stockLabel in stockLabels {
            updateStockLabel(with: stockLabel)
        }
    }
    
    func takeJuiceOrder(from button: UIButton) throws -> JuiceMaker.Juice {
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
            throw SystemError.invaildButton
        }
    }
    
    func presentCompleteMakingJuiceAlert(juice: JuiceMaker.Juice) {
        let completeAlert = UIAlertController(title: "\(juice.description) 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        completeAlert.addAction(confirmAction)
        
        self.present(completeAlert, animated: true, completion: nil)
    }
    
    func presentNotEnoughStockAlert() {
        let notEnoughStockAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let modifyStockAction = UIAlertAction(title: "재고 수정", style: .default) { _ in
            self.performSegue(withIdentifier: "showModifyStock", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        
        notEnoughStockAlert.addAction(modifyStockAction)
        notEnoughStockAlert.addAction(cancelAction)
        
        self.present(notEnoughStockAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllStockLabels()
        notificantionCenter.addObserver(self, selector: #selector(updateAllStockLabels), name: .completeMakingJuice, object: nil)
    }
}

extension Notification.Name {
    static let completeMakingJuice = Notification.Name("completeMakingJuice")
}
