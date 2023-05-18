//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeText()
    }
    
    @IBAction private func orderJuiceButtonTap(_ sender: UIButton) {
        guard let title = sender.currentTitle else {
            print("버튼이 설정되지 않았습니다.")
            return
        }
        
        switch title {
        case "딸기쥬스 주문":
            orderJuice(.strawberryJuice)
        case "바나나쥬스 주문":
            orderJuice(.bananaJuice)
        case "파인애플쥬스 주문":
            orderJuice(.pineappleJuice)
        case "키위쥬스 주문":
            orderJuice(.kiwiJuice)
        case "망고쥬스 주문":
            orderJuice(.mangoJuice)
        case "딸바쥬스 주문":
            orderJuice(.strawberryBananaJuice)
        case "망키쥬스 주문":
            orderJuice(.mangoKiwiJuice)
        default:
            break
        }
    }
    
    @IBAction private func changeStockButtonTap(_ sender: UIBarButtonItem) {
        pushChangeStockViewController()
    }
    
    private func composeText() {
        strawberryStockLabel.text = String(juiceMaker.fruitStore.bringStock(.strawberry))
        bananaStockLabel.text = String(juiceMaker.fruitStore.bringStock(.banana))
        pineappleStockLabel.text = String(juiceMaker.fruitStore.bringStock(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.fruitStore.bringStock(.kiwi))
        mangoStockLabel.text = String(juiceMaker.fruitStore.bringStock(.mango))
    }
    
    private func orderJuice(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            popUpSuccessMessage(juice)
            composeText()
        } catch JuiceMakerError.outOfStock {
            popUpFailMessage()
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
    
    private func pushChangeStockViewController() {
        guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewControllerID") else {
            print("해당 뷰컨트롤러ID를 가진 뷰컨트롤러가 스토리보드에 없습니다.")
            return
        }
        self.navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    private func popUpSuccessMessage(_ juice: Juice) {
        let alertMessage = UIAlertController(title: "주문 성공", message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default))
        present(alertMessage, animated: true)
    }
    
    private func popUpFailMessage() {
        let alertMessage = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default) { _ in
            self.pushChangeStockViewController()
        })
        alertMessage.addAction(UIAlertAction(title: "아니오", style: .default))
        present(alertMessage, animated: true)
    }
}
