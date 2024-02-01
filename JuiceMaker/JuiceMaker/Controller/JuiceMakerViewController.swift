//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController, JuiceMakerViewDelegate {
    var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let juiceMakerView = self.view as? JuiceMakerView else {
            return
        }
        juiceMakerView.delegate = self
        
        updateAllFruitQuantityLabel()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("FruitQuantityHasBeenUpdated"),
                                               object: nil,
                                               queue: nil) { notification in
            guard let fruit = notification.userInfo?["changedFruit"] as? Fruit else {
                return
            }
            
            self.updateSingleFruitQuantityLabel(fruit: fruit)
        }
    }
    
    func presentStockEditView() {
        guard let stockEditViewController = self.storyboard?.instantiateViewController(identifier: "StockEditNavigationController") else {
            return
        }
        
        self.present(stockEditViewController, animated: true, completion: nil)
    }
    
    func touchUpJuiceOrderButton(_ view: JuiceMakerView, juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            alertResultOfOrder(juice: juice)
            
            for (fruit, _) in juice.recipe {
                updateSingleFruitQuantityLabel(fruit: fruit)
            }
        } catch FruitStoreError.insufficientFruits {
            alertResultOfOrder(juice: juice, failedWith: .insufficientFruits)
        } catch {
            alertResultOfOrder(juice: juice, failedWith: .fruitNotFound)
        }
    }
    
    func updateSingleFruitQuantityLabel(fruit: Fruit) {
        guard let juiceMakerView = self.view as? JuiceMakerView else {
            return
        }
        
        guard let quantity = try? FruitStore.shared.getQuantity(of: fruit) else {
            return
        }
        
        juiceMakerView.updateSingleFruitQuantityLabel(fruit: fruit, quantity: quantity)
    }
    
    func updateAllFruitQuantityLabel() {
        for fruit in Fruit.allCases {
            updateSingleFruitQuantityLabel(fruit: fruit)
        }
    }
    
    func alertResultOfOrder(juice: Juice, failedWith error: FruitStoreError? = nil) {
        var alertControllerTitle: String
        var alertControllerMessage: String
        var alertActions: [UIAlertAction] = []
        
        switch error {
        case nil:
            alertControllerTitle = "주문 성공"
            alertControllerMessage = "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!"
            alertActions.append(UIAlertAction(title: "확인", style: .default))
        case .insufficientFruits:
            alertControllerTitle = "주문 실패"
            alertControllerMessage = "재료가 모자라요. 재고를 수정할까요?"
            alertActions.append(UIAlertAction(title: "예", style: .default) { _ in
                self.presentStockEditView()
            })
            alertActions.append(UIAlertAction(title: "아니오", style: .cancel))
        case .fruitNotFound:
            alertControllerTitle = "주문 실패"
            alertControllerMessage = "알 수 없는 오류가 발생했습니다."
            alertActions.append(UIAlertAction(title: "확인", style: .default))
        }
        
        let alertController = UIAlertController(title: alertControllerTitle,
                                                message: alertControllerMessage,
                                                preferredStyle: .alert)
        
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        
        present(alertController, animated: true)
    }
}
