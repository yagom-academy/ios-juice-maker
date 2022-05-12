//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    @IBOutlet private weak var strawberryLabel: UILabel?
    @IBOutlet private weak var bananaLabel: UILabel?
    @IBOutlet private weak var pineappleLabel: UILabel?
    @IBOutlet private weak var kiwiLabel: UILabel?
    @IBOutlet private weak var mangoLabel: UILabel?
    
    private let juiceMaker = JuiceMaker()
    private var storeViewManager = StoreViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        storeViewManager.delegate = self
    }
}

extension OrderViewController {
    @IBAction func juiceButtonDidTapped(_ sender: UIButton) {
        self.orderJuice(sender.currentTitle ?? "")
        self.updateUI()
    }
    
    @IBAction func editStockButtonDidTapped(_ sender: UIBarButtonItem) {
        self.presentStoreView()
    }
}

extension OrderViewController: StoreViewDelegate {
    func stepperValueDidChanged(_ viewController: StoreViewController, fruit: FruitType, with amount: Int) {
        juiceMaker.editStock(of: fruit, with: amount)
    }
    
    func didCanceledStoreViewController(_ viewController: StoreViewController) {
        self.updateUI()
    }
}

private extension OrderViewController {
    func orderJuice(_ name: String?) {
        guard let selectedJuice = name?.components(separatedBy: "쥬스 주문")[0],
              let orderedJuice = JuiceType(rawValue: selectedJuice) else {
            return
        }
        
        let juice = Drink(juice: orderedJuice)
        let result = juiceMaker.make(juice)
        
        result.handleValue { _ in
            self.presentConfirmAlert(message: "\(orderedJuice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        }
        
        result.handleError { error in
            self.presentWarningAlert(message: error.message)
        }
    }
    
    func presentStoreView() {
        let storeViewController = StoreViewController.instantiate(bundle: nil, identifier: "StoreViewController")
        storeViewController.modalTransitionStyle = .coverVertical
        storeViewController.fruits = juiceMaker.stockUp()
        storeViewController.manager = storeViewManager
        self.present(storeViewController, animated: true)
    }
    
    func updateUI() {
        self.strawberryLabel?.text = juiceMaker.count(.strawberry).description
        self.bananaLabel?.text = juiceMaker.count(.banana).description
        self.pineappleLabel?.text = juiceMaker.count(.pineapple).description
        self.kiwiLabel?.text = juiceMaker.count(.kiwi).description
        self.mangoLabel?.text = juiceMaker.count(.mango).description
    }
}

// MARK: Alert
private extension OrderViewController {
    func presentConfirmAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: false)
    }
    
    func presentWarningAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: "예", style: .default) { _ in
            self.presentStoreView()
        }
        let negativeAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertController.addAction(positiveAction)
        alertController.addAction(negativeAction)
        self.present(alertController, animated: false)
    }
}
