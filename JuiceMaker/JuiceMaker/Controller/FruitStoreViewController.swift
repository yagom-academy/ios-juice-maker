//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE
//

import UIKit

class FruitStoreViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
    @IBOutlet private var fruitLabels: [UILabel]!
    @IBOutlet private var fruitSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockAndStepper()
    }
    
    @IBAction private func changeStepperValue(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            fruitLabels[sender.tag].text = Int(fruitSteppers[sender.tag].value).description
            fruitStore.stocks[fruit] = Int(fruitSteppers[sender.tag].value)
        }
    }
    
    @IBAction private func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setStockAndStepper() {
        for fruitIndex in 0..<fruitLabels.count {
            guard let fruit = Fruit(rawValue: fruitIndex),
                  let fruitStock = fruitStore.stocks[fruit] else {
                return
            }
            fruitLabels[fruitIndex].text = fruitStock.description
            fruitSteppers[fruitIndex].value = Double(fruitStock)
        }
    }
}
