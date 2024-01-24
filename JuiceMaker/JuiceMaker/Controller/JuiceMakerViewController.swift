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
    }
    
    func juiceMakerViewStockEditButtonSelected(_ view: JuiceMakerView) {
        guard let fillStockViewController = self.storyboard?.instantiateViewController(identifier: "FillStockViewController") else {
            return
        }
        
        self.present(fillStockViewController, animated: true, completion: nil)
    }
    
    @IBAction func orderStrawberryBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(.strawberryBanana)
            orderSucceedStrawberryBananaJuice()
        } catch FruitStoreError.insufficientFruits {
            orderFailedStrawberryBananaJuice()
        } catch {
            print("예상치 못한 오류가 발생했습니다.")
        }
    }
    
    func orderSucceedStrawberryBananaJuice() {
        let orderSucceedAlert = UIAlertController(title: "주문 성공", message: "딸기바나나쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        orderSucceedAlert.addAction(ok)
        present(orderSucceedAlert, animated: true, completion: nil)
    }
    
    func orderFailedStrawberryBananaJuice() {
        let orderFailedAlert = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "네", style: .default, handler: nil)
        let no = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        orderFailedAlert.addAction(yes)
        orderFailedAlert.addAction(no)
        present(orderFailedAlert, animated: true, completion: nil)
    }
}

