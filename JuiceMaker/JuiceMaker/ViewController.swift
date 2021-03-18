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
  
  func getAlert(_ isSuccess: Bool, _ message: String) {
    let alert = UIAlertController(title: "",
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    
    let btnOK = UIAlertAction(title: "확인", style: .default)
    let btnMove = UIAlertAction(title: "예", style: .default) { (action) in
      self.performSegue(withIdentifier: "goToModifyStockView", sender: self)
    }
    let btnCancel = UIAlertAction(title: "아니오", style: .cancel)
    
    if(isSuccess) {
      alert.addAction(btnOK)
    } else {
      alert.addAction(btnMove)
      alert.addAction(btnCancel)
    }
    
    present(alert,
            animated: false,
            completion: nil)
  }
  
  @IBAction func orderJuice(_ sender: UIButton) {
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
    
    let juice = juiceMaker.make(of: orderedJuice)
    guard let isSuccess: Bool = juice["isSuccess"] as? Bool else {
      return
    }
    guard let message: String = juice["message"] as? String else {
      return
    }
    
    updateFruitStockQuantity()
    getAlert(isSuccess, message)
  }
}
