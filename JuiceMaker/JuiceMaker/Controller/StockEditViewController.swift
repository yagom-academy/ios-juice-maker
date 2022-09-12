//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

import UIKit

class StockEditViewController: UIViewController {
    
    weak var delegate: FruitStoreDelegate?
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func updateFruitStockLabel() {
        if let strawberryStock = try? delegate?.fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
        } else {
            strawberryStockLabel.text = FruitStoreError.notExist
        }
        if let bananaStock = try? delegate?.fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
        } else {
            bananaStockLabel.text = FruitStoreError.notExist
        }
        if let kiwiStock = try? delegate?.fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
        } else {
            kiwiStockLabel.text = FruitStoreError.notExist
        }
        if let pineappleStock = try? delegate?.fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
        } else {
            pineappleStockLabel.text = FruitStoreError.notExist
        }
        if let mangoStock = try? delegate?.fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
        } else {
            mangoStockLabel.text = FruitStoreError.notExist
        }
    }
}
