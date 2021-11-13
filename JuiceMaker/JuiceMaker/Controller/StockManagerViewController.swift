//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/26.
//

import UIKit

class StockManagerViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStockLabels()
        setupNavigationBar()
    }
    
    @IBAction func changeStrawberryStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .strawberry)
    }
    @IBAction func changeBananaStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .banana)
    }
    @IBAction func changePineappleStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .pineapple)
    }
    @IBAction func changeKiwiStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .kiwi)
    }
    @IBAction func changeMangoStock(_ sender: UIStepper) {
        applyChanges(from: sender, to: .mango)
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
        let cancel = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(dismissStockManagerViewController))
        navigationBarItem.rightBarButtonItem = cancel
        navigationBarItem.title = "재고 수정"
        
        let width = self.view.frame.width
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 32))
        navigationBar.isTranslucent = false
        navigationBar.items = [navigationBarItem]
        self.view.addSubview(navigationBar)
    }
    
    private func applyChanges(from stepper: UIStepper, to fruit: Fruit) {
        let stepperResetValue = 0.0
        let stepperValue = Int(stepper.value)
        let fruitLabel = convertToUILabel(from: fruit)
        do {
            try update(fruitLabel, by: stepperValue)
        } catch StockManagerError.excessiveReduction {
            AlertManager.presentExcessiveReductionAlert(on: self)
            return
        } catch {
            AlertManager.presentErrorAlert(on: self)
            return
        }
        changeStock(of: fruit, by: stepperValue)
        stepper.value = stepperResetValue
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
            return self.strawberryStockLabel
        case .banana:
            return self.bananaStockLabel
        case .pineapple:
            return self.pineappleStockLabel
        case .kiwi:
            return self.kiwiStockLabel
        case .mango:
            return self.mangoStockLabel
        }
    }
    
    private func update(_ stockLabel: UILabel, by amount: Int) throws {
        guard let stockLabelText = stockLabel.text, let currentStockAmount = Int(stockLabelText) else {
            return
        }
        let newAmount = currentStockAmount + amount
        guard newAmount >= 0 else {
            throw StockManagerError.excessiveReduction
        }
        stockLabel.text = "\(newAmount)"
    }
    
    @objc
    private func dismissStockManagerViewController() {
        dismiss(animated: true, completion: nil)
    }
}

