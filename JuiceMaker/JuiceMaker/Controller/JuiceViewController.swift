//
//  JuiceMaker - ViewController.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
  
  @IBOutlet private weak var strawberryCountLabel: UILabel!
  @IBOutlet private weak var bananaCountLabel: UILabel!
  @IBOutlet private weak var pineappleCountLabel: UILabel!
  @IBOutlet private weak var kiwiCountLabel: UILabel!
  @IBOutlet private weak var mangoCountLabel: UILabel!
  
  @IBOutlet private weak var strawberryBananaButton: UIButton!
  @IBOutlet private weak var mangoKiwiButton: UIButton!
  @IBOutlet private weak var strawberryButton: UIButton!
  @IBOutlet private weak var bananaButton: UIButton!
  @IBOutlet private weak var pineappleButton: UIButton!
  @IBOutlet private weak var kiwiButton: UIButton!
  @IBOutlet private weak var mangoButton: UIButton!
  
  private let juiceMaker = JuiceMaker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchStock()
  }
  
  @IBAction private func didTapOrderButton(_ sender: UIButton) {
    guard let juice = self.selectJuice(sender) else {
      return
    }
    let result = self.juiceMaker.make(juice)
    switch result {
    case .success(let juice):
      self.presentAlert(message: String(describing: juice), actions: [
        UIAlertAction(title: AlertSetting.ok, style: .default)
      ])
    case .failure(let error):
      self.presentAlert(message: error.errorDescription, actions: [
        UIAlertAction(title: AlertSetting.yes, style: .default, handler: self.handleOkAction),
        UIAlertAction(title: AlertSetting.no, style: .cancel)
      ])
    }
    self.fetchStock()
  }
  
  @IBAction private func didTapChangeStockButton(_ sender: UIBarButtonItem) {
    self.presentStockViewController()
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
    self.strawberryCountLabel.text = self.convertStockToString(.strawberry)
    self.bananaCountLabel.text = self.convertStockToString(.banana)
    self.pineappleCountLabel.text = self.convertStockToString(.pineapple)
    self.kiwiCountLabel.text = self.convertStockToString(.kiwi)
    self.mangoCountLabel.text = self.convertStockToString(.mango)
  }
  
  func convertStockToString(_ fruit: Fruit) -> String {
    guard let fruitAmount = self.juiceMaker.fruitStore.stock[fruit] else {
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
    self.presentStockViewController()
  }
  
  func presentStockViewController() {
    guard let navigationController = self.storyboard?.instantiateViewController(
      withIdentifier: StoryboardID.stockNavigationController) as? UINavigationController
    else {
      return
    }
    guard let stockViewController = navigationController.visibleViewController
      as? StockViewController
    else {
      return
    }
    stockViewController.juiceMaker = juiceMaker
    stockViewController.delegate = self
    self.present(navigationController, animated: true)
  }
}

extension JuiceViewController: StockDelegate {
  func update() {
    self.fetchStock()
  }
}
