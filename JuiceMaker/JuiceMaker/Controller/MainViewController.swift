//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private var stockLabels: [StockLabel] = []
    @IBOutlet private var juiceOrderButtons: [JuiceOrderButton] = []
    let juiceMaker = JuiceMaker.juiceMaker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton()
        updateLabel()
    }
    
    private func orderButton() {
        JuiceOrderButton.connectJuice(to: juiceOrderButtons)
    }
    
    private func updateLabel() {
        StockLabel.update(numbers: stockLabels, of: juiceMaker.fruitStore)
    }

    @IBAction private func juiceOrderButton(_ sender: JuiceOrderButton) {
        guard let juice = sender.juice else { return }
        
        do {
            if try juiceMaker.checkStockPresence (juice) {
                juiceMaker.make(juice)
                completeAlert(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!")
                updateLabel()
            } else {
                outOfStock(title: "재고가 모자라요. 재고를 수정할까요?")
            }
        } catch JuiceMakerError.invalidJuice {
            print(JuiceMakerError.invalidJuice.message)
        } catch {
            return
        }
    }
}

extension MainViewController {
    private func completeAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.updateLabel()
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func outOfStock(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "stockChange", sender: nil)
        })
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
