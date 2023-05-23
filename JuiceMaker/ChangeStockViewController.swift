//
//  StockViewController.swift
//  JuiceMaker
//  Created by Yetti, yy-ss99, Mary.

import UIKit

protocol StockDelegate: AnyObject {
    func getCurrentStock() -> [Int]
    func addStock(quantities: [Int])
}

class ChangeStockViewController: UIViewController {
    private var initialStock: [Int] = []
    private var afterStockLabels = [Int](repeating: 0, count: Fruits.allCases.count)
    @IBOutlet var stockChangeLabels: [UILabel]!
    @IBOutlet var stockChangeSteppers: [UIStepper]!
       
    weak var delegate: StockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStockLabel()
    }
    
    private func initializeStockLabel() {
        guard let currentStock = delegate?.getCurrentStock() else { return }
        initialStock = currentStock
        for (index, label) in stockChangeLabels.enumerated() {
            label.text = "\(initialStock[index])"
        }
    }
    
    @IBAction func closeStockView(_ sender: UIBarButtonItem) {
        delegate?.addStock(quantities: afterStockLabels)
        afterStockLabels.removeAll()
        dismiss(animated: true)
    }
    
    @IBAction func hitStepper(_ sender: UIStepper) {
        stockChangeLabels[sender.tag].text = "\(initialStock[sender.tag] + Int(sender.value))"
        afterStockLabels[sender.tag] = Int(sender.value)
    }
}
