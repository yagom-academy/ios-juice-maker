//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  let juiceMaker = JuiceMaker()
  
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
  
  func showAlert() {
    let alert = UIAlertController(title: "",
                                  message: juiceMaker.orderResult.message,
                                  preferredStyle: UIAlertController.Style.alert)
    
    if juiceMaker.orderResult.isSuccessed {
      let okAction = UIAlertAction(title: "확인", style: .default)
      
      alert.addAction(okAction)
    } else {
      let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
      let moveAction = UIAlertAction(title: "예", style: .default) { (action) in
        self.performSegue(withIdentifier: "goToModifyStockView", sender: self)
      }
      
      alert.addAction(cancelAction)
      alert.addAction(moveAction)
    }
    
    present(alert,
            animated: false,
            completion: nil)
  }
  
  @IBAction func touchUpOrderButton(_ sender: UIButton) {
    guard let buttonTitle = sender.titleLabel else {
      return
    }
    guard let buttonTitleText = buttonTitle.text else {
      return
    }
    let juiceName = buttonTitleText.replacingOccurrences(of: " 주문", with: "")
    guard let orderedJuice = Juice(rawValue: juiceName) else {
      return
    }
    
    do {
      try juiceMaker.make(of: orderedJuice)
    } catch {
      print(error)
    }
    
    updateFruitStockQuantity()
    showAlert()
  }
}
