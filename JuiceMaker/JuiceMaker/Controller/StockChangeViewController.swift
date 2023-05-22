//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by myungsun on 2023/05/15.
//

import UIKit

protocol StockChangeDelegate: AnyObject {
    func changeStock(with fruitInventory: [Fruit: Int])
}

final class StockChangeViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel] = []
    @IBOutlet var stockSteppers: [UIStepper] = []
    var fruitStore: FruitStore?
    weak var delegate: StockChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeComponents()
        setStockStepperTag()
    }
    
    @IBAction func updateFruitStock(_ sender: UIStepper) {
        let index = sender.tag
        let fruitStockLabel = fruitStockLabels[index]
        let quantity = Int(sender.value)
        guard let fruit = Fruit(rawValue: index) else { return }
        
        fruitStockLabel.text = "\(quantity)"
        fruitStore?.updateStock(of: fruit, to: quantity)
    }
    
    @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
        guard let fruitStore = fruitStore else { return }
        
        delegate?.changeStock(with: fruitStore.fruitInventory)
        dismiss(animated: true)
    }
    
    private func initializeComponents() {
        for (index, (fruitStockLabel, stockStepper)) in zip(fruitStockLabels, stockSteppers).enumerated() {
            guard let fruit = Fruit(rawValue: index),
                  let fruitCount = fruitStore?.getCurrentStock(of: fruit) else { return }
            fruitStockLabel.text = "\(fruitCount)"
            stockStepper.value = Double(fruitCount)
        }
    }
    
    private func setStockStepperTag() {
        for (tag, stockStepper) in stockSteppers.enumerated() {
            stockStepper.tag = tag
        }
    }
}
