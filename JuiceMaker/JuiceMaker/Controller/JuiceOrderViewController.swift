//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitStockLabelCollection: [UILabel]!
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    enum AlertType {
        case onlyConfirm
        case canCancel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillStockLabel()
    }

    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text,
              let juice = Juice(rawValue: title)
        else {
            return
        }

        do {
            try juiceMaker.makeOrder(juice)
            fillStockLabel()
            showAlert(message: "\(juice.koreanName) 쥬스 나왔습니다!", alertType: .onlyConfirm)
        } catch FruitStoreError.outOfStock {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?", alertType: .canCancel)
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
    
    private func showAlert(message: String, alertType: AlertType) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        var confirmAction: UIAlertAction = UIAlertAction(title: "확인", style: .default)
        let cancelAction: UIAlertAction = UIAlertAction(title: "아니오", style: .destructive)
                
        switch alertType {
        case .onlyConfirm:
            break
        case .canCancel:
            confirmAction = UIAlertAction(title: "예", style: .default) { _ in
                self.performSegue(withIdentifier: "goToStockViewController", sender: nil)
            }
            alert.addAction(cancelAction)
        }
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    private func fillStockLabel() {
        let currentStockList: [String] = juiceMaker.showRemainStock()
        
        for index in fruitStockLabelCollection.indices {
            fruitStockLabelCollection[index].text = currentStockList[index]
        }
    }
}
