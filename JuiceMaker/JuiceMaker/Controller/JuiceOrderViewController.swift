//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

protocol Configurable {
    mutating func assignLabelText()
}

final class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitStockLabelCollection: [UILabel]!
    @IBOutlet var orderJuiceButtonCollection: [CustomButton]!
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    private enum AlertType {
        case onlyConfirm
        case canCancel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStockLabel()
        configureJuiceButtonCustomIdentifier()
    }

    @IBAction func touchUpOrderButton(_ sender: CustomButton) {
        guard let juice = sender.customIdentifier else { return }
        
        do {
            try juiceMaker.makeOrder(juice)
            configureStockLabel()
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
    
    private func configureStockLabel() {
        let currentStockList: [String] = juiceMaker.showRemainStock()
        
        for index in fruitStockLabelCollection.indices {
            fruitStockLabelCollection[index].text = currentStockList[index]
        }
    }
    
    private func configureJuiceButtonCustomIdentifier() {
        for index in orderJuiceButtonCollection.indices {
            orderJuiceButtonCollection[index].customIdentifier = Juice.allCases[index]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stockManagementViewController =
                segue.destination as? StockManagementViewController
        else {
            return
        }
        
        stockManagementViewController.configurationDelegate = self
    }
}

extension JuiceOrderViewController: Configurable {
    func assignLabelText() {
        configureStockLabel()
    }
}
