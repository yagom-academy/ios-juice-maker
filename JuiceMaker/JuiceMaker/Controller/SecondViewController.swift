//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/11.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var fruitStockLabels = [StockLabel]()
    @IBOutlet var stockSteppers = [StockStepper]()
    let juiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try StockStepper.connectFruit(to: stockSteppers)
            try StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
        } catch {
            alert(error: error)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(_ sender: StockStepper) {
        guard let fruit = sender.fruit else {
            return alert(title: "오류", message: "스태퍼 고장", actionTypes: [.cancel("닫기", nil)])
        }
        juiceMaker.manageStock(fruit, by: Int(sender.value - sender.previousStepperValue))
        do {
            try StockLabel.update(labels: fruitStockLabels, by: juiceMaker.stock)
        } catch {
            alert(error: error)
        }
        sender.previousStepperValue = sender.value
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
