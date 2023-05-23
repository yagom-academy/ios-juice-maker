//
//  JuiceMaker - ViewController.swift
//  Created by jusbug, Erick.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private var juiceMaker = JuiceMaker()

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setText()
    }
    
    @IBAction private func tapOrderJuiceButton(_ sender: UIButton) {
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
    
    @IBAction private func tapChangeStockButton(_ sender: UIBarButtonItem) {
        pushChangeStockViewController()
    }
    
    private func setText() {
        strawberryStockLabel.text = String(juiceMaker.fruitStore.bringStock(.strawberry))
        bananaStockLabel.text = String(juiceMaker.fruitStore.bringStock(.banana))
        pineappleStockLabel.text = String(juiceMaker.fruitStore.bringStock(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.fruitStore.bringStock(.kiwi))
        mangoStockLabel.text = String(juiceMaker.fruitStore.bringStock(.mango))
    }
    
    private func orderJuice(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            popUpSuccessAlert(juice)
            setText()
        } catch JuiceMakerError.outOfStock {
            popUpFailAlert()
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
    
    private func pushChangeStockViewController() {
        let pushViewControllerID = ChangeStockViewController.id
        guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: pushViewControllerID) as? ChangeStockViewController else {
            print("해당 뷰컨트롤러ID를 가진 뷰컨트롤러가 스토리보드에 없습니다.")
            return
        }
        pushViewController.fruitStore = juiceMaker.fruitStore
        pushViewController.delegate = self
        self.navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    private func popUpSuccessAlert(_ juice: Juice) {
        let alertMessage = makeAlertMessage("주문 성공", "\(juice.name) 나왔습니다! 맛있게 드세요!", actionTitle: "예", actionType: .default)
        present(alertMessage, animated: true)
    }
    
    private func popUpFailAlert() {
        let alertMessage = makeAlertMessage("주문 실패", "재료가 모자라요. 재고를 수정할까요?", actionTitle: "아니오", actionType: .destructive)
        alertMessage.addAction(UIAlertAction(title: "예", style: .cancel) { _ in
            self.pushChangeStockViewController()
        })
        present(alertMessage, animated: true)
    }
}

extension JuiceMakerViewController: ChangeStockDelegate {
    func changeStock(fruitStore: FruitStore) {
        self.juiceMaker.fruitStore = fruitStore
        setText()
    }
}
