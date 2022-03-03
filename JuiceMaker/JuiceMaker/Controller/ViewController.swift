//
//  JuiceMaker - ViewController.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
  
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
  
  @IBAction func didTapOrderButton(_ sender: UIButton) {
    guard let juice = self.selectJuice(sender) else {
      return
    }
    let juiceMaker = JuiceMaker()
    let result = juiceMaker.make(juice)
    switch result {
    case .success(let juice):
      self.presentSuccessAlert(juice)
    case .failure(let error):
      self.presentFailureAlert(error)
    }
    self.fetchStock()
  }
}

// MARK: - Private Extension

private extension ViewController {
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
    guard let fruitAmount = FruitStore.shared.stock[fruit] else {
      return String(Int.zero)
    }
    return String(fruitAmount)
  }
  
  func presentSuccessAlert(_ juice: Juice) {
    let okAction = UIAlertAction(title: AlertSetting.ok, style: .default)
    let alert = AlertSetting.presentAlert(
      title: AlertSetting.notice,
      message: String(describing: juice),
      preferredStyle: .alert,
      actions: [okAction]
    )
    self.present(alert, animated: true)
  }
  
  func presentFailureAlert(_ error: MakeJuiceError) {
    let okAction = UIAlertAction(title: AlertSetting.yes, style: .default, handler: handleOkAction)
    let noAction = UIAlertAction(title: AlertSetting.no, style: .destructive)
    let alert = AlertSetting.presentAlert(
      title: AlertSetting.notice,
      message: error.errorDescription,
      preferredStyle: .alert,
      actions: [noAction, okAction]
    )
    self.present(alert, animated: true)
  }
  
  func handleOkAction(_ action: UIAlertAction) {
    guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "stockVC")
    else {
      return
    }
    self.present(stockVC, animated: true)
  }
}
