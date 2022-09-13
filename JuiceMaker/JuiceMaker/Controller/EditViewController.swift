//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    var store: FruitStore?
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockCount()
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func updateStockCount() {
        guard var newStock = store?.stock else { return }
        
        for fruitCountLabel in fruitCountLabels {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
    
    func setStore(from store: FruitStore) {
        self.store = store
    }
}
