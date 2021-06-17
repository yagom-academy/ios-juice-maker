//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

//MARK:- 저장 프로퍼티 및 라이프사이클
class ViewController: UIViewController {
    @IBOutlet var numberOfStrawberry: UILabel!
    @IBOutlet var numberOfBanana: UILabel!
    @IBOutlet var numberOfPineApple: UILabel!
    @IBOutlet var numberOfKiwi: UILabel!
    @IBOutlet var numberOfMango: UILabel!
    
    @IBOutlet var orderStrawberryButton: UIButton!
    @IBOutlet var orderBananaButton: UIButton!
    @IBOutlet var orderPineAppleButton: UIButton!
    @IBOutlet var orderkiwiButton: UIButton!
    @IBOutlet var orderMangoButton: UIButton!
    @IBOutlet var orderStrawberryBananaButton: UIButton!
    @IBOutlet var orderMangoKiwiButton: UIButton!
    
    var juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumberOnLabel(fruits: juiceMaker.fruitStore.inventory)
        setUpTargetActionOnButtons()
        registerObserver()
    }

    deinit {
        turnOffObserver()
    }
}

//MARK:- 레이블과 버튼 셋팅
extension ViewController {
    
    func setUp(number: Int, on label: UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberry)
            case .banana:
                setUp(number: fruit.value, on: numberOfBanana)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineApple)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwi)
            case .mango:
                setUp(number: fruit.value, on: numberOfMango)
            }
        }
    }
    
    func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderkiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
    }
}

//MARK:- 쥬스 주문 관련
extension ViewController {
    
    @objc func orderJuice(_ sender: UIButton) {
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
        
        self.present(generateAlert(by: result), animated: true, completion: nil)
    }
 
    func generateAlert(by result: JuiceMaker.JuiceMakingResult) -> UIAlertController {
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

//MARK:- 화면이동 관련
extension ViewController {
    func transitionToStockManagement(_ sender: UIAlertAction) {
        let segueName = "segueToStockManagement"
        performSegue(withIdentifier: segueName, sender: sender)
    }
}

//MARK:- Notification 이름 정의
extension Notification.Name {
    static let fruitsAmountDidChange = Notification.Name("fruitsAmountDidChange")
}

//MARK:- NotificationCenter Observer 관련
extension ViewController {
    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeFruitsAmount(_:)), name: .fruitsAmountDidChange, object: nil)
    }
    
    @objc func didChangeFruitsAmount(_ noti: Notification) {
        guard let userInfo = noti.userInfo, let fruitInfo = userInfo as? [Fruit: Int] else {
            return
        }
        self.showNumberOnLabel(fruits: fruitInfo)
    }
    
    func turnOffObserver() {
        NotificationCenter.default.removeObserver(self, name: .fruitsAmountDidChange, object: nil)
    }
}
