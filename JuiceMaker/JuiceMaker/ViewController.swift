//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker(stock: Stock(basicValue: 10))
    @IBOutlet var fruitStockLabels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabels()
    }
    
    @IBAction func juiceOrderButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else { return }
        
        if juiceMaker.stock.hasFruits(for: juice) {
            juiceMaker.make(juice)
            updateFruitStockLabels()
            alert(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!", actionTypes: [.ok("감사합니다!")])
        } else {
            alert(title: "재고가 모자라요.", message: "재고를 수정할까요?", actionTypes: [.ok("예", { _ in self.performSegue(withIdentifier: "stockChanger", sender: nil)}), .cancel("아니오")])
        }
    }
    
    func updateFruitStockLabels() {
        for index in 0..<fruitStockLabels.count {
            guard let fruitType = Fruit(rawValue: index) else { return }
            guard let stock = juiceMaker.stock.fruits[fruitType] else { return }
            
            fruitStockLabels[index].text = String(stock)
        }
    }
    
    func alert(title: String, message: String, actionTypes: [UIAlertAction.ActionType]) {
        let alertController = UIAlertController(title: title, message: message)
        
        for actionType in actionTypes {
            alertController.addAction(actionType.action())
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
