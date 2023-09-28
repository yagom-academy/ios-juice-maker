//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Lee minyeol on 2023/09/18.
//

import UIKit

class StockViewController: UIViewController {
    var fruitInventory: [Fruit: Int] = [:]
    var delegate: StockDelegate?
    
    @IBOutlet var fruitStockLabelArray: [UILabel]!
    @IBOutlet var fruitStockStepperArray: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStock()
        configureStepValue()
    }

    @IBAction func clickCloseButton(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
        
        delegate?.updateStock(to: fruitInventory)
    }
    
    func configureStock() {
        for (index, stockLabel) in fruitStockLabelArray.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            
            stockLabel.text = findStock(with: fruit).description
        }
    }
    
    func configureStepValue() {
        for (index, stockStepper) in fruitStockStepperArray.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            
            stockStepper.value = Double(findStock(with: fruit))
        }
    }
    
    func updateStock(fruit: Fruit, stock: Int) {
        fruitInventory[fruit] = stock
    }
    
    func findStock(with fruit: Fruit) -> Int {
        guard let stock = fruitInventory[fruit] else {
            return 0
        }
        
        return stock
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }

        fruitStockLabelArray[sender.tag].text = Int(sender.value).description
        
        updateStock(fruit: fruit, stock: Int(sender.value))
    }
}
