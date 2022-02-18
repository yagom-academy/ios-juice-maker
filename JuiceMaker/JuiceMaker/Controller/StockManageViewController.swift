//
//  StockManageViewController.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import UIKit

class StockManageViewController: UIViewController {
    var fruitStore: FruitStore?
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        strawberryStock.text = "\(fruitStore?.store[.strawberry] ?? 0)"
        bananaStock.text = "\(fruitStore?.store[.banana] ?? 0)"
        pineappleStock.text = "\(fruitStore?.store[.pineapple] ?? 0)"
        kiwiStock.text = "\(fruitStore?.store[.kiwi] ?? 0)"
        mangoStock.text = "\(fruitStore?.store[.mango] ?? 0)"
    }

}
