//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Kiseok, 쥬봉이 on 2023/09/15.
//

import UIKit

final class StockChangeViewController: UIViewController {
    
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
        strawberryStockLabel.text = String(fruitStore.fruits[.strawberry] ?? .zero)
        bananaStockLabel.text = String(fruitStore.fruits[.banana] ?? .zero)
        pineappleStockLabel.text = String(fruitStore.fruits[.pineapple] ?? .zero)
        kiwiStockLabel.text = String(fruitStore.fruits[.kiwi] ?? .zero)
        mangoStockLabel.text = String(fruitStore.fruits[.mango] ?? .zero)
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
