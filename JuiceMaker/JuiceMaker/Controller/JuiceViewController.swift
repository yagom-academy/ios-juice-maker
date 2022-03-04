//
//  JuiceMaker - ViewController.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
  
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
  
  let juiceMaker = JuiceMaker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchStock()
  }
  
  @IBAction func didTapOrderButton(_ sender: UIButton) {
    guard let juice = self.selectJuice(sender) else {
      return
    }
    let result = juiceMaker.make(juice)
    switch result {
    case .success(let juice):
      let okAction = UIAlertAction(title: AlertSetting.ok, style: .default)
      self.presentAlert(message: String(describing: juice), actions: [okAction])
    case .failure(let error):
      let okAction = UIAlertAction(title: AlertSetting.yes, style: .default, handler: handleOkAction)
      let noAction = UIAlertAction(title: AlertSetting.no, style: .cancel)
      self.presentAlert(message: error.errorDescription, actions: [okAction, noAction])
    }
    self.fetchStock()
  }
}

// MARK: - Private Extension

private extension JuiceViewController {
  func selectJuice(_ sender: UIButton) -> Juice? {
    guard let buttonTitle = sender.titleLabel?.text,
          let juiceName = buttonTitle.components(separatedBy: " ").first
    else {
      return nil
    }
    return Juice(rawValue: juiceName)
  }
  
  func fetchStock() {
    strawberryCountLabel.text = self.convertStockToString(.strawberry)
    bananaCountLabel.text = self.convertStockToString(.banana)
    pineappleCountLabel.text = self.convertStockToString(.pineapple)
    kiwiCountLabel.text = self.convertStockToString(.kiwi)
    mangoCountLabel.text = self.convertStockToString(.mango)
  }
  
  func convertStockToString(_ fruit: Fruit) -> String {
    guard let fruitAmount = juiceMaker.fruitStore.stock[fruit] else {
      return String(Int.zero)
    }
    return String(fruitAmount)
  }
  
  func presentAlert(message: String?, actions: [UIAlertAction]) {
    let alert = AlertSetting.createAlertController(
      title: AlertSetting.notice,
      message: message,
      preferredStyle: .alert,
      actions: actions
    )
    self.present(alert, animated: true)
  }
  
  func handleOkAction(_ action: UIAlertAction) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let stockViewController = storyboard.instantiateViewController(
      withIdentifier: "StockViewController"
    ) as? StockViewController
    else {
      return
    }
    self.present(stockViewController, animated: true)
  }
}
