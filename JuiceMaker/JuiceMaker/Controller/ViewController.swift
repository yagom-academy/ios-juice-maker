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
        JuiceOrderButton.connectJuice(to: juiceOrderButtons)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: JuiceOrderButton) {
        guard let juice = sender.juice else { fatalError() }
        
        do {
            if try juiceMaker.stock.hasFruits(for: juice) {
                juiceMaker.make(juice)
                alert(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!", actionTypes: [.ok("감사합니다!")])
                StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
            } else {
                alert(title: "재고가 모자라요.", message: "재고를 수정할까요?", actionTypes: [.ok("예", { _ in self.performSegue(withIdentifier: "stockChanger", sender: nil)}), .cancel("아니오")])
            }
        } catch StockError.invalidSelection {
            print(StockError.invalidSelection.message)
        } catch { fatalError() }
    }
    
    func alert(title: String, message: String, actionTypes: [UIAlertAction.ActionType]) {
        let alertController = UIAlertController(title: title, message: message)
        
        for actionType in actionTypes {
            alertController.addAction(actionType.action())
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
