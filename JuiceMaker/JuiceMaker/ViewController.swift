//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

import UIKit

class ViewController: UIViewController {
    // MARK:- property
    @IBOutlet var fruitStockLabels: [UILabel]!
    let juiceMaker = JuiceMaker()
    var hasStock: Bool = true
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    // MARK:- Method
    @IBAction func juiceOrderButton(_ sender: Any) {
        hasStock = true
        guard let button = sender as? UIButton else { return }
        guard let juice = Juice(rawValue: button.tag) else { fatalError() }
        
        for fruit in juice.recipe {
            if juiceMaker.stock.fruits[fruit.key]! < fruit.value {
                hasStock = false
            }
        }
        
        if hasStock {
            juiceMaker.makeJuice(juice)
            orderCompletedAlert(juiceName: juice.name)
        } else {
            orderFailAlert()
        }
    }
    
    func updateFruitStockLabel() {
        for index in 0..<fruitStockLabels.count {
            guard let stock = juiceMaker.stock.fruits[Fruit(rawValue: index)!] else { fatalError() }
            fruitStockLabels[index].text = String(stock)
        }
    }
}
// MARK:- Extension
extension ViewController {
    func orderCompletedAlert(juiceName: String) {
        let alert = UIAlertController(title: "\(juiceName) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "감사합니다!", style: .default, handler: nil)
        
        updateFruitStockLabel()
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func orderFailAlert() {
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
