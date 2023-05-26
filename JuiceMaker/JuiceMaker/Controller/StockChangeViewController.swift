//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by myungsun on 2023/05/15.
//

import UIKit

protocol StockChangeDelegate: AnyObject {
    func changeStockViewControllerWillDismiss()
}

final class StockChangeViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel] = []
    @IBOutlet var stockSteppers: [UIStepper] = []
    
    var fruitStore: FruitStore?
    weak var delegate: StockChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponentsData()
    }
    
    private func setComponentsData() {
        for (index, (fruitStockLabel, stockStepper)) in zip(fruitStockLabels, stockSteppers).enumerated() {
            guard let fruit = Fruit(rawValue: index),
                  let fruitCount = fruitStore?.getCurrentStock(of: fruit) else { return }
            
            fruitStockLabel.text = "\(fruitCount)"
            stockStepper.value = Double(fruitCount)
            stockStepper.tag = index
        }
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
        delegate?.changeStockViewControllerWillDismiss()
        dismiss(animated: true)
    }
}
