//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel]!
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStockLabel()
    }

    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let title = sender.title(for: .normal),
              let juice = Juice(rawValue: title)
        else {
            return
        }

        do {
            try juiceMaker.makeOrder(juice)
            changeStockLabel()
            showSuccessAlert(message: "\(juice.koreanName) 쥬스 나왔습니다!")
        } catch FruitStoreError.outOfStock {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    private func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
            self.performSegue(withIdentifier: "goToStockViewController", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .destructive)
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    private func changeStockLabel() {
        for (fruitStockLabel, fruit) in zip(fruitStockLabels, Fruit.allCases) {
            fruitStockLabel.text = juiceMaker.fruitStore.showRemainStock(of: fruit)
        }
    }
}
