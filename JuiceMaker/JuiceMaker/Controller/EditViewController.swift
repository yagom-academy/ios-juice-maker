//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var fruitCountLabelArray: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let storageStock = StockStorage.shared.stock else { return }
        
        updateStockCount(stock: storageStock)
        StockStorage.shared.stock = nil
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func updateStockCount(stock: [Int]) {
        var newStock = stock
        
        for fruitCountLabel in fruitCountLabelArray {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
}
