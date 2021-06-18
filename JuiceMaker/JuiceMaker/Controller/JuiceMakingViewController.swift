//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

//MARK:- Stored Property and LifeCycle
class JuiceMakingViewController: UIViewController {
    @IBOutlet private var numberOfStrawberryLabel: UILabel!
    @IBOutlet private var numberOfBananaLabel: UILabel!
    @IBOutlet private var numberOfPineAppleLabel: UILabel!
    @IBOutlet private var numberOfKiwiLabel: UILabel!
    @IBOutlet private var numberOfMangoLabel: UILabel!
    
    @IBOutlet private var orderStrawberryButton: UIButton!
    @IBOutlet private var orderBananaButton: UIButton!
    @IBOutlet private var orderPineAppleButton: UIButton!
    @IBOutlet private var orderkiwiButton: UIButton!
    @IBOutlet private var orderMangoButton: UIButton!
    @IBOutlet private var orderStrawberryBananaButton: UIButton!
    @IBOutlet private var orderMangoKiwiButton: UIButton!
    
    private var juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumberOnLabel(fruits: juiceMaker.fruitStore.inventory)
        setUpTargetActionOnButtons()
        registerObserver()
    }

    deinit {
        removeObserver()
    }
}

//MARK:- Label and Button Setting
extension JuiceMakingViewController {
    private func setUp(number: Int, on label: UILabel) {
        label.text = String(number)
    }
    
    private func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberryLabel)
            case .banana:
                setUp(number: fruit.value, on: numberOfBananaLabel)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineAppleLabel)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwiLabel)
            case .mango:
                setUp(number: fruit.value, on: numberOfMangoLabel)
            }
        }
    }
    
    private func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderkiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
    }
}

//MARK:- Juice Order Related
extension JuiceMakingViewController {
    
    @objc private func orderJuice(_ sender: UIButton) {
        let result: JuiceMaker.JuiceMakingResult
        switch sender {
        case orderStrawberryButton:
            result = juiceMaker.produce(kindOf: .strawberry)
        case orderBananaButton:
            result = juiceMaker.produce(kindOf: .banana)
        case orderPineAppleButton:
            result = juiceMaker.produce(kindOf: .pineapple)
        case orderkiwiButton:
            result = juiceMaker.produce(kindOf: .kiwi)
        case orderMangoButton:
            result = juiceMaker.produce(kindOf: .mango)
        case orderStrawberryBananaButton:
            result = juiceMaker.produce(kindOf: .strawberryBanana)
        case orderMangoKiwiButton:
            result = juiceMaker.produce(kindOf: .mangoKiwi)
        default:
            let message = "알 수 없는 버튼을 누르셨습니다."
            result = .failure(description: message)
        }
        
        self.present(generateAlert(by: result), animated: true)
    }
 
    private func generateAlert(by result: JuiceMaker.JuiceMakingResult) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        switch result {
        case .success(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        case .failure(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: transitionToStockManagement(_:)))
            alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        }
        return alert
    }
}

//MARK:- Screen Transition Related
extension JuiceMakingViewController {
    private func transitionToStockManagement(_ sender: UIAlertAction) {
        let segueName = "segueToStockManagement"
        performSegue(withIdentifier: segueName, sender: sender)
    }
}

//MARK:- Notification Name Definition
extension Notification.Name {
    static let fruitsAmountDidChange = Notification.Name("fruitsAmountDidChange")
}

//MARK:- NotificationCenter Observer Related
extension JuiceMakingViewController {
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeFruitsAmount(_:)), name: .fruitsAmountDidChange, object: nil)
    }
    
    @objc private func didChangeFruitsAmount(_ noti: Notification) {
        guard let userInfo = noti.userInfo, let fruitInfo = userInfo as? [Fruit: Int] else {
            return
        }
        self.showNumberOnLabel(fruits: fruitInfo)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: .fruitsAmountDidChange, object: nil)
    }
}
