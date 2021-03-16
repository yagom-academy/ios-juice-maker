//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/11.
//

import UIKit

class SecondViewController: UIViewController {
    let juiceMaker = JuiceMaker.shared
    @IBOutlet var fruitStockLabels = [UILabel]()
    var previousStepperValues = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(labels: fruitStockLabels, by: juiceMaker.stock)
        previousStepperValues = Array(repeating: 0, count: fruitStockLabels.count)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        juiceMaker.manageStock(fruit, by: Int(sender.value - previousStepperValues[sender.tag]))
        update(labels: fruitStockLabels, by: juiceMaker.stock)
        previousStepperValues[sender.tag] = sender.value
    }
}
