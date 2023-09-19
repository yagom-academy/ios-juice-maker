//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Kiseok, 쥬봉이 on 2023/09/15.
//

import UIKit

class StockChangeViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private let fruitStore: FruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        strawberryStockLabel.text = String(fruitStore.fruits[.strawberry] ?? 0)
        bananaStockLabel.text = String(fruitStore.fruits[.banana] ?? 0)
        pineappleStockLabel.text = String(fruitStore.fruits[.pineapple] ?? 0)
        kiwiStockLabel.text = String(fruitStore.fruits[.kiwi] ?? 0)
        mangoStockLabel.text = String(fruitStore.fruits[.mango] ?? 0)
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
