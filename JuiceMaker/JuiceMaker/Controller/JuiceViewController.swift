//
//  JuiceMaker - ViewController.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
  
  @IBOutlet private var fruitCountLabels: [UILabel]!

  private let juiceMaker = JuiceMaker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateLabel()
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
    self.updateLabel()
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
  
  func updateLabel() {
    for (label, fruit) in zip(self.fruitCountLabels, Fruit.allCases) {
      if let fruitAmount = self.juiceMaker.fruitStore.stock[fruit] {
        label.text = String(fruitAmount)
      } else {
        label.text = String(Int.zero)
      }
    }
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
    guard let navigationController =
            self.storyboard?.instantiateViewController(
              withIdentifier: StockNavigationController.identifier) as? UINavigationController,
          let stockViewController =
            navigationController.visibleViewController as? StockViewController
    else {
      return
    }
    stockViewController.delegate = self
    stockViewController.setJuiceMaker(self.juiceMaker)
    self.present(navigationController, animated: true)
  }
}

extension JuiceViewController: StockDelegate {
  func update() {
    self.updateLabel()
  }
}
