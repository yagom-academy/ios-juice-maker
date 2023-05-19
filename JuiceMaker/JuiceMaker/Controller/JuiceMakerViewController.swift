//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController, ChangeStockProtocol {
    private var juiceMaker = JuiceMaker()

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
        guard let title = sender.currentTitle,
              let juice = Juice(rawValue: title) else {
            print("버튼이 설정되지 않았습니다.")
            return
        }
        
        orderJuice(juice)
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
    
    func changeStock(fruitStore: FruitStore) {
        self.juiceMaker.fruitStore = fruitStore
        composeText()
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
    
    private func popUpSuccessMessage(_ juice: Juice) {
        let alertMessage = makeAlertMessage("주문 성공", "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", actionTitle: "예", actionType: .default)
        present(alertMessage, animated: true)
    }
    
    private func popUpFailMessage() {
        let alertMessage = makeAlertMessage("주문 실패", "재료가 모자라요. 재고를 수정할까요?", actionTitle: "아니오", actionType: .destructive)
        alertMessage.addAction(UIAlertAction(title: "예", style: .cancel) { _ in
            self.pushChangeStockViewController()
        })
        present(alertMessage, animated: true)
    }
}
