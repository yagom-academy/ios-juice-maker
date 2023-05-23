//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

protocol Stock {
    func setStock(stocks: [Int])
    func getStock() -> [Int]
}

class ModifyStockViewController: UIViewController, Stock {

    var fruitStocks: [Int] = [Int]()
    @IBOutlet var fruitStockLabels: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBAction func dismissModal(_ sender: UIButton) {
        // stepper 구현 예정
        for i in 0..<fruitStocks.count {
            fruitStocks[i] += 100
        }
        dismiss(animated: true, completion: nil)
    }

    func setStock(stocks: [Int]) {
        fruitStocks = stocks
    }
    
    func getStock() -> [Int] {
        return fruitStocks
    }
    
    func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStocks[fruitStockLabel.tag])
        }
    }
}
