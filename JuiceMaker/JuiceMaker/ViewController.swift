//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

import UIKit

class ViewController: UIViewController {
    // MARK:- property
    @IBOutlet var fruitStockLabels: [UILabel]!
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let juiceMaker = JuiceMaker()
        updateFruitStockLabel(by: juiceMaker)
        }
    // MARK:- Method
    func updateFruitStockLabel(by juiceMaker: JuiceMaker) {
        for index in 0..<fruitStockLabels.count {
            guard let stock = juiceMaker.stock.fruits[Fruit(rawValue: index)!] else { fatalError() }
            fruitStockLabels[index].text = String(stock)
        }
    }
}

