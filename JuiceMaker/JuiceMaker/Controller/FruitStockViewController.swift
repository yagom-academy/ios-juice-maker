//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Zion, Mint = 형민트 on 2023/05/12.
//

import UIKit

final class FruitStockViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockSteppers: [UIStepper]!
    
    private var fruitStore: FruitStore
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.fruitStore = fruitStore
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFruitLabelsText()
        setUpFruitStockStepper()
    }
    
    private func provideStockLabelText(fruit: Fruit) -> String {
        guard let stock = fruitStore.provideFruitStock(fruit) else {
            return "x"
        }
        
        return String(stock)
    }
    
    private func setUpFruitLabelsText() {
        for (index, fruitLabel) in fruitStockLabels.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }

            fruitLabel.text = provideStockLabelText(fruit: fruit)
        }
    }
    
    private func setUpFruitStockStepper() {
        for (index, fruitStockStepper) in fruitStockSteppers.enumerated() {
            guard let fruit = Fruit(rawValue: index),
                    let amount = fruitStore.provideFruitStock(fruit) else { return }
            
            fruitStockStepper.value = Double(amount)
        }
    }
}

// MARK: - Button Action
extension FruitStockViewController {
    @IBAction func tappedFruitStepper(_ sender: UIStepper) {
        guard fruitStockLabels.count > sender.tag else { return }
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        let amount = Int(sender.value)
        
        fruitStockLabels[sender.tag].text = "\(amount)"
        fruitStore.changeFruitCount(fruit, amount)
    }
    
    @IBAction func tappedDismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
