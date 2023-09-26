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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStock()
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
    
    func findStock(with fruit: Fruit) -> Int {
        guard let stock = fruitInventory[fruit] else {
            return 0
        }
        
        return stock
    }
}
