//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    var juiceMaker: JuiceMakerProtocol = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(resultInMakingJuice),
            name: Notification.Name("resultInmakingJuice"),
            object: nil)
    }
    
    @objc func resultInMakingJuice(_ notice: Notification) {
        debugPrint("나왓다 호호")
        guard let bindedIsSuccess: Bool = notice.userInfo?["isMakingSuccess"] as? Bool else {
            return
        }
        if bindedIsSuccess {
            let succeedAlert = UIAlertController(
                title: nil,
                message: "(쥬스종류) 쥬스 나왔습니다! 맛있게 드세요!",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            succeedAlert.addAction(okAction)
            present(succeedAlert, animated: true, completion: nil)
        } else {
            let failedAlert = UIAlertController(
                title: nil,
                message: "재고가 모자라요. 재고를 수정할까요?",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "예",
                style: .default) { action in
                    self.performSegue(
                        withIdentifier: "presentFruitStockEditorViewController",
                        sender: self)
                }
            let cancelAction = UIAlertAction(
                title: "아니오",
                style: .cancel
            )
            failedAlert.addAction(okAction)
            failedAlert.addAction(cancelAction)
            present(failedAlert, animated: true, completion: nil)
        }
        
        
        
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
    }
    
    func receiveFruitStock() -> [Fruit: Int]{
        return juiceMaker.sendFruitStockValue()
    }
    
    func updateFruitAmountLabel(currentStockValue: [Fruit: Int]) {
        for target in currentStockValue {
            switch target.key {
            case .strawberry:
                updateLabel(amount: target.value, label: strawberryAmountLabel)
            case .banana:
                updateLabel(amount: target.value, label: bananaAmountLabel)
            case .kiwi:
                updateLabel(amount: target.value, label: kiwiAmountLabel)
            case .pineapple:
                updateLabel(amount: target.value, label: pineappleAmountLabel)
            case .mango:
                updateLabel(amount: target.value, label: mangoAmountLabel)
            }
        }
    }
    
    func updateLabel(amount: Int, label: UILabel) {
        label.text = "\(String(amount))"
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .strawberryBananaJuice)
    }
    
    @IBAction func touchUpstrawberryJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .bananaJuice)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .pineappleJuice)
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .kiwiJuice)
    }
    
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .mangoJuice)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .mangoKiwiJuice)
    }
    
    
}
