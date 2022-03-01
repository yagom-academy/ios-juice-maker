//
//  JuiceMaker - ViewController.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  // IBOutlet
  @IBOutlet weak var strawberryCountLabel: UILabel!
  @IBOutlet weak var bananaCountLabel: UILabel!
  @IBOutlet weak var pineappleCountLabel: UILabel!
  @IBOutlet weak var kiwiCountLabel: UILabel!
  @IBOutlet weak var mangoCountLabel: UILabel!
  
  @IBOutlet weak var strawberryBananaButton: UIButton!
  @IBOutlet weak var mangoKiwiButton: UIButton!
  @IBOutlet weak var strawberryButton: UIButton!
  @IBOutlet weak var bananaButton: UIButton!
  @IBOutlet weak var pineappleButton: UIButton!
  @IBOutlet weak var kiwiButton: UIButton!
  @IBOutlet weak var mangoButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchStock()
  }
  
  // IBAction
  @IBAction func didTapOrderButton(_ sender: UIButton) {}
  
  private func fetchStock() {
    let fruitStore = FruitStore.shared
    strawberryCountLabel.text = "\(fruitStore.stock[.strawberry] ?? 0)"
    bananaCountLabel.text = "\(fruitStore.stock[.banana] ?? 0)"
    pineappleCountLabel.text = "\(fruitStore.stock[.pineapple] ?? 0)"
    kiwiCountLabel.text = "\(fruitStore.stock[.kiwi] ?? 0)"
    mangoCountLabel.text = "\(fruitStore.stock[.mango] ?? 0)"
  }
  
  private func createAlertController(
    title: String?,
    message: String?,
    preferredStyle: UIAlertController.Style,
    actions: UIAlertAction...
  ) -> UIAlertController {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: preferredStyle
    )
    actions.forEach { action in
      alertController.addAction(action)
    }
    return alertController
  }
}
