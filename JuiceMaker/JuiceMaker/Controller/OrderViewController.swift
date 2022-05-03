//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValue()
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let orderedJuice = JuiceType(rawValue: sender.tag) else {
            return
        }
        
        let juice = Drink(juice: orderedJuice)
        let result = juiceMaker.make(juice)
        
        switch result {
        case .success(let juice):
            showConfirmAlert(message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!")
        case .failure(let error):
            check(error: error)
        }

        updateValue()
    }
}

private extension OrderViewController {
    func updateValue() {
        self.strawberryLabel.text = juiceMaker.fruitStore.count(.strawberry).description
        self.bananaLabel.text = juiceMaker.fruitStore.count(.banana).description
        self.pineappleLabel.text = juiceMaker.fruitStore.count(.pineapple).description
        self.kiwiLabel.text = juiceMaker.fruitStore.count(.kiwi).description
        self.mangoLabel.text = juiceMaker.fruitStore.count(.mango).description
    }
    
    func showConfirmAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: false)
    }
    
    func showWarningAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: "예", style: .default) { _ in
            self.move(to: "StoreViewController")
        }
        let negativeAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertController.addAction(positiveAction)
        alertController.addAction(negativeAction)
        self.present(alertController, animated: false)
    }
    
    func check(error: StockError) {
        switch error {
        case .notEnoughIngredient(let errorStr):
            showWarningAlert(message: errorStr)
        }
    }
}
