//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStockLabel()
    }

    @IBAction func orderJuiceButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else { return }
        
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
        strawberryStockLabel.text = juiceMaker
            .fruitStore.showRemainStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker
            .fruitStore.showRemainStock(of: .banana)
        pineappleStockLabel.text = juiceMaker
            .fruitStore.showRemainStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker
            .fruitStore.showRemainStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker
            .fruitStore.showRemainStock(of: .mango)
    }
}
