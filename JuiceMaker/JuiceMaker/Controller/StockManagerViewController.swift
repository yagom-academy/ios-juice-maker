//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/26.
//

import UIKit

class StockManagerViewController: UIViewController {
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBananaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStockLabels()
        setupNavigationBar()
    }
    
    @IBAction func changeStrawberryStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .strawberry)
        sender.value = 0.0
    }
    @IBAction func changeBananaStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .bananna)
        sender.value = 0.0
    }
    @IBAction func changePineappleStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .pineapple)
        sender.value = 0.0
    }
    @IBAction func changeKiwiStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .kiwi)
        sender.value = 0.0
    }
    @IBAction func changeMangoStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .mango)
        sender.value = 0.0
    }
    
    private func setupStockLabels() {
        let currentFruitStock = juiceMaker.retrieveCurrentFruitStock()
        let fruits = currentFruitStock.keys
        let amounts = currentFruitStock.values
        
        for (fruit, amount) in zip(fruits, amounts) {
            setCurrentStockLabel(of: fruit, to: amount)
        }
    }
    
    private func setCurrentStockLabel(of fruit: Fruit, to amount: Int) {
        let stockLabel = convertToUILabel(from: fruit)
        stockLabel.text = "\(amount)"
    }
    
    private func setupNavigationBar() {
        let navigationBarItem = UINavigationItem()
        let cancel = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(dismissStockManagerVC))
        navigationBarItem.rightBarButtonItem = cancel
        navigationBarItem.title = "재고 수정"
        
        let width = self.view.frame.width
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 32))
        navigationBar.isTranslucent = false
        navigationBar.items = [navigationBarItem]
        self.view.addSubview(navigationBar)
    }
    
    private func applyChanges(from stepper: UIStepper, to fruit: Fruit) {
        let stepperValue = Int(stepper.value)
        changeStock(of: fruit, by: stepperValue)
        let fruitLabel = convertToUILabel(from: fruit)
        update(fruitLabel, by: stepperValue)
    }
    
    private func changeStock(of fruit: Fruit, by amount: Int) {
        if amount > 0 {
            juiceMaker.increaseStock(of: fruit, by: amount)
        } else if amount < 0 {
            juiceMaker.reduceStock(of: fruit, by: -amount)
        }
    }
    
    private func convertToUILabel(from fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return self.currentStrawberryStockLabel
        case .bananna:
            return self.currentBananaStockLabel
        case .pineapple:
            return self.currentPineappleStockLabel
        case .kiwi:
            return self.currentKiwiStockLabel
        case .mango:
            return self.currentMangoStockLabel
        }
    }
    
    private func update(_ stockLabel: UILabel, by amount: Int) {
        if let stockLabelText = stockLabel.text, let originalValue = Int(stockLabelText) {
            stockLabel.text = "\(originalValue + amount)"
        }
    }
    
    @objc
    private func dismissStockManagerVC() {
        dismiss(animated: true, completion: nil)
    }
}
