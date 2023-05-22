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
    }
}
