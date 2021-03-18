//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fruitStockLabels = [StockLabel]()
    @IBOutlet var juiceOrderButtons = [JuiceOrderButton]()
    let juiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try JuiceOrderButton.connectJuice(to: juiceOrderButtons)
        } catch {
            alert(error: error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            try StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
        } catch {
            alert(error: error)
        }
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: JuiceOrderButton) {
        guard let juice = sender.juice else {
            return alert(title: "오류", message: "버튼 고장", actionTypes: [.cancel("닫기", nil)])
        }
        
        do {
            if try juiceMaker.stock.hasFruits(for: juice) {
                juiceMaker.make(juice)
                alert(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!", actionTypes: [.ok("감사합니다!")])
                try StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
            } else {
                alert(title: "재고가 모자라요.", message: "재고를 수정할까요?", actionTypes: [.ok("예", { _ in self.performSegue(withIdentifier: "stockChanger", sender: nil)}), .cancel("아니오")])
            }
        } catch {
            alert(error: error)
        }
    }
    
    func alert(title: String, message: String, actionTypes: [UIAlertAction.ActionType]) {
        let alertController = UIAlertController(title: title, message: message)
        
        for actionType in actionTypes {
            alertController.addAction(actionType.action())
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func alert(error: Error) {
        alert(title: "오류", message: "\(error)", actionTypes: [.cancel("닫기", nil)])
    }
}
