//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Lee minyeol on 2023/09/18.
//

import UIKit

class StockViewController: UIViewController {
    var fruitInventory: [Fruit: Int] = [:]
    
    @IBOutlet var fruitStockLabel: [UILabel]!
    @IBOutlet var fruitStockStteper: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStock()
        configureStepValue()
    }

    @IBAction func clickCloseButton(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
    func configureStock() {
        for (index, stockLabel) in fruitStockLabel.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            
            stockLabel.text = findStock(with: fruit).description
        }
    }
    
    func configureStepValue() {
        for (index, stockStepper) in fruitStockStteper.enumerated() {
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

        fruitStockLabel[sender.tag].text = Int(sender.value).description
        
        updateStock(fruit: fruit, stock: Int(sender.value))
    }
}
