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

// MARK: - Extension

private extension ViewController {
  func selectJuice(_ sender: UIButton) -> Juice? {
    switch sender {
    case strawberryBananaButton:
      return .strawberryBanana
    case mangoKiwiButton:
      return .mangoKiwi
    case strawberryButton:
      return .strawberry
    case bananaButton:
      return .banana
    case pineappleButton:
      return .pineapple
    case kiwiButton:
      return .kiwi
    case mangoButton:
      return .mango
    default:
      return nil
    }
  }
  
  func fetchStock() {
    let fruitStore = FruitStore.shared
    strawberryCountLabel.text = "\(fruitStore.stock[.strawberry] ?? 0)"
    bananaCountLabel.text = "\(fruitStore.stock[.banana] ?? 0)"
    pineappleCountLabel.text = "\(fruitStore.stock[.pineapple] ?? 0)"
    kiwiCountLabel.text = "\(fruitStore.stock[.kiwi] ?? 0)"
    mangoCountLabel.text = "\(fruitStore.stock[.mango] ?? 0)"
  }
  
  private func presentSuccessAlert(_ juice: Juice) {
    let okAction = UIAlertAction(title: AlertSetting.ok, style: .default)
    let alert = AlertSetting.presentAlert(
      title: AlertSetting.notice,
      message: "\(juice)",
      preferredStyle: .alert,
      actions: [okAction]
    )
    self.present(alert, animated: true)
  }
  
  private func presentFailureAlert(_ error: MakeJuiceError) {
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
  
  private func handleOkAction(_ action: UIAlertAction) {
    guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "stockVC")
    else {
      return
    }
    self.present(stockVC, animated: true)
  }
}
