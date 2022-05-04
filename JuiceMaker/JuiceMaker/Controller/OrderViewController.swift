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
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func juiceButtonDidTapped(_ sender: UIButton) {
        orderJuice(sender)
        updateUI()
    }
}

private extension OrderViewController {
    func orderJuice(_ sender: UIButton) {
        guard let orderedJuice = JuiceType(rawValue: sender.tag) else {
            return
        }
        
        let juice = Drink(juice: orderedJuice)
        let result = juiceMaker.make(juice)
        
        switch result {
        case .success(let juice):
            presentConfirmAlert(message: "\(juice.localeKorean) 쥬스 나왔습니다! 맛있게 드세요!")
        case .failure(let error):
            presentWarningAlert(message: error.message)
        }
    }
    
    func updateUI() {
        self.strawberryLabel.text = juiceMaker.count(.strawberry)
        self.bananaLabel.text = juiceMaker.count(.banana)
        self.pineappleLabel.text = juiceMaker.count(.pineapple)
        self.kiwiLabel.text = juiceMaker.count(.kiwi)
        self.mangoLabel.text = juiceMaker.count(.mango)
    }
}

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
            self.move(to: "StoreViewController")
        }
        let negativeAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertController.addAction(positiveAction)
        alertController.addAction(negativeAction)
        self.present(alertController, animated: false)
    }
}
