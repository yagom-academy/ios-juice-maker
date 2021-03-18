//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/11.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var fruitStockLabels = [UILabel]()
    @IBOutlet var stockSteppers = [StockStepper]()
    let juiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StockStepper.connectFruit(to: stockSteppers)
        update(labels: fruitStockLabels, by: juiceMaker.stock)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(_ sender: StockStepper) {
        guard let fruit = sender.fruit else { return }
        juiceMaker.manageStock(fruit, by: Int(sender.value - sender.previousStepperValue))
        update(labels: fruitStockLabels, by: juiceMaker.stock)
        sender.previousStepperValue = sender.value
    }
}
