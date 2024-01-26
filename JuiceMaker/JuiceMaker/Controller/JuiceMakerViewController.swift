//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController, JuiceMakerViewDelegate {
    var juiceMaker = JuiceMaker(fruitStore: FruitStore(fruits: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let juiceMakerView = self.view as? JuiceMakerView else {
            return
        }
        
        juiceMakerView.delegate = self
        juiceMakerViewUpdateFruitQuantityLabel(juiceMakerView)
    }
    
    func juiceMakerViewStockEditButtonTouchedUp() {
        guard let fillStockViewController = self.storyboard?.instantiateViewController(identifier: "FillStockViewController") else {
            return
        }
        
        self.present(fillStockViewController, animated: true, completion: nil)
    }
    
    func juiceMakerViewJuiceOrderButtonTouchedUp(_ view: JuiceMakerView, juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            alertSuccessToOrder(juice: juice)
            juiceMakerViewUpdateFruitQuantityLabel(view)
        } catch FruitStoreError.insufficientFruits {
            alertFailureToOrder()
        } catch {
            print("예상치 못한 오류가 발생했습니다.")
        }
    }
    
    func juiceMakerViewUpdateFruitQuantityLabel(_ view: JuiceMakerView) {
        let fruits = juiceMaker.fruitStore.fruitBox
        
        view.updateFruitQuantityLabel(fruits: fruits)
    }
    
    func alertSuccessToOrder(juice: Juice) {
        let orderSucceedAlert = UIAlertController(title: "주문 성공",
                                                  message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!",
                                                  preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인",
                                    style: .default,
                                    handler: nil)
        
        orderSucceedAlert.addAction(confirm)
        present(orderSucceedAlert, animated: true, completion: nil)
    }
    
    func alertFailureToOrder() {
        let orderFailedAlert = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default) { _ in self.juiceMakerViewStockEditButtonTouchedUp()
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        orderFailedAlert.addAction(confirm)
        orderFailedAlert.addAction(cancel)
        present(orderFailedAlert, animated: true, completion: nil)
    }
}
