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
    @IBOutlet var stockChangeLabels: [UILabel]!
    @IBOutlet var stockChangeSteppers: [UIStepper]!
    
    weak var delegate: StockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStockLabel()
    }
    
    private func initializeStockLabel() {
        guard let initialStock = delegate?.getCurrentStock() else { return }
        for (index, label) in stockChangeLabels.enumerated() {
            label.text = "\(initialStock[index])"
        }
    }
    
    @IBAction func closeStockView(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
