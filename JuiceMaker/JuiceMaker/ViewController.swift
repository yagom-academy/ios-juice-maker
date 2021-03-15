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
            orderCompletedAlert(with: juice.name)
        } else {
            outOfStockAlert()
        }
    }
    
    func updateFruitStockLabels() {
        for index in 0..<fruitStockLabels.count {
            guard let fruitType = Fruit(rawValue: index) else { return }
            guard let stock = juiceMaker.stock.fruits[fruitType] else { return }
            
            fruitStockLabels[index].text = String(stock)
        }
    }
}

extension ViewController {
    func orderCompletedAlert(with juiceName: String) {
        let alert = UIAlertController(title: "\(juiceName) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "감사합니다!", style: .default, handler: nil)
        
        updateFruitStockLabels()
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func outOfStockAlert() {
        let alert = UIAlertController(title: "재고가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "stockChanger", sender: nil)
        })
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
}
