//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

protocol StockReceivable: AnyObject {
    func setStock(stocks: [Int])
    func getStock() -> [Int]
}

class ModifyStockViewController: UIViewController, StockReceivable {

    @IBOutlet var fruitStockLabels: [UILabel]!
    var stocks: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let stocks = stocks else {
            return
        }
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            fruitStockLabel.text = String(stocks[index])
        }
    }   
    
    @IBAction func dismissModal(_ sender: UIButton) {
        guard let stocks = stocks else {
            return
        }
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            fruitStockLabel.text = String(stocks[index] + 123)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func setStock(stocks: [Int]) {
        self.stocks = stocks
    }
    
    func getStock() -> [Int] {
        return fruitStockLabels.compactMap{ $0.text }.compactMap{ Int($0) }
    }
}
