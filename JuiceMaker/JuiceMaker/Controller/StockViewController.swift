//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Lee minyeol on 2023/09/18.
//

import UIKit

final class StockViewController: UIViewController {
    var fruitInventory: [Fruit: Int] = [:]
    var delegate: StockDelegate?
    
    @IBOutlet private var fruitStockLabelArray: [UILabel]!
    @IBOutlet private var fruitStockStepperArray: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStock()
        configureStepValue()
    }
    
    @IBAction private func clickCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
        delegate?.updateStock(to: fruitInventory)
    }
    
    @IBAction private func clickStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        configureLabelArray(index: sender.tag, value: sender.value)
        
        updateStock(fruit: fruit, stock: Int(sender.value))
    }
    
    private func configureStock() {
        for (index, stockLabel) in fruitStockLabelArray.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            
            stockLabel.text = findStock(with: fruit).description
        }
    }
    
    private func configureStepperValue() {
        for (index, stockStepper) in fruitStockStepperArray.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            
            stockStepper.value = Double(findStock(with: fruit))
        }
    }
    
    private func updateStock(fruit: Fruit, stock: Int) {
        fruitInventory[fruit] = stock
    }
    
    private func configureLabelArray(index: Int, value: Double) {
        fruitStockLabelArray[index].text = Int(value).description
    }
    
    private func findStock(with fruit: Fruit) -> Int {
        guard let stock = fruitInventory[fruit] else {
            return 0
        }
        
        return stock
    }
}
