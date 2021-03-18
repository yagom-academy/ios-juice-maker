//
//  modifyStockViewController.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/16.
//

import UIKit

class modifyStockViewController: UIViewController {
  
  
  @IBOutlet var strawberryStockQuantityLabel: UILabel!
  @IBOutlet var bananaStockQuantityLabel: UILabel!
  @IBOutlet var pineappleStockQuantityLabel: UILabel!
  @IBOutlet var kiwiStockQuantityLabel: UILabel!
  @IBOutlet var mangoStockQuantityLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateFruitStockQuantity()
  }
  
  func updateFruitStockQuantity() {
    strawberryStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.strawberry))"
    bananaStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.banana))"
    pineappleStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.pineapple))"
    kiwiStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.kiwi))"
    mangoStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.mango))"
  }
  
  @IBAction func touchUpDismissButton(_ sender: UIButton) {
    dismiss(animated: true,
            completion: nil)
  }
}
