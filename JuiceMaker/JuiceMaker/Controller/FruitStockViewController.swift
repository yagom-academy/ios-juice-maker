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
    
    private let fruitStore: FruitStore
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.fruitStore = fruitStore
        
        super.init(coder: coder)
    }
    
    @available(*, unavailable)
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
    
    private func refreshFruitLabelText(index: Int) {
        guard fruitStockLabels.count > index else { return }
        guard let fruit = Fruit(rawValue: index),
              let amount = fruitStore.provideFruitStock(fruit) else { return }
        
        fruitStockLabels[index].text = "\(amount)"
    }
}

// MARK: - Button Action
extension FruitStockViewController {
    @IBAction func tappedFruitStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        guard let oldAmount = fruitStore.provideFruitStock(fruit) else { return }
        
        let gapAmount = sender.value - Double(oldAmount) > 0 ? sender.stepValue : -sender.stepValue
        
        fruitStore.changeFruitCount(fruit, Int(gapAmount))
        refreshFruitLabelText(index: sender.tag)
    }
    
    @IBAction func tappedDismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
