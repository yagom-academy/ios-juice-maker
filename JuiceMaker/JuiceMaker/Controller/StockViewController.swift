//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by song on 2022/02/28.
//

import UIKit

final class StockViewController: UIViewController {
  
  @IBOutlet private weak var strawberryCountLabel: UILabel!
  @IBOutlet private weak var bananaCountLabel: UILabel!
  @IBOutlet private weak var pineappleCountLabel: UILabel!
  @IBOutlet private weak var kiwiCountLabel: UILabel!
  @IBOutlet private weak var mangoCountLabel: UILabel!
  
  @IBOutlet private weak var strawberryStepper: UIStepper!
  @IBOutlet private weak var bananaStepper: UIStepper!
  @IBOutlet private weak var pineappleStepper: UIStepper!
  @IBOutlet private weak var kiwiStepper: UIStepper!
  @IBOutlet private weak var mangoStepper: UIStepper!
  
  var juiceMaker: JuiceMaker?
  var delegate: StockDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateLabel()
    self.updateStepper()
  }
  
  @IBAction private func didStepperValueChanged(_ sender: UIStepper) {
    guard let fruit = self.selectFruit(sender) else {
      return
    }
    self.juiceMaker?.fruitStore.setStock(of: fruit, Int(sender.value))
    self.updateLabel()
  }
  
  @IBAction private func didTapCloseButton(_ sender: UIBarButtonItem) {
    self.delegate?.update()
    self.dismiss(animated: true)
  }
}

// MARK: - Private Extension

private extension StockViewController {
  func selectFruit(_ sender: UIStepper) -> Fruit? {
    switch sender {
    case strawberryStepper:
      return .strawberry
    case bananaStepper:
      return .banana
    case pineappleStepper:
      return .pineapple
    case kiwiStepper:
      return .kiwi
    case mangoStepper:
      return .mango
    default:
      return nil
    }
  }
  
  func updateLabel() {
    self.strawberryCountLabel.text = self.convertStockToString(.strawberry)
    self.bananaCountLabel.text = self.convertStockToString(.banana)
    self.pineappleCountLabel.text = self.convertStockToString(.pineapple)
    self.kiwiCountLabel.text = self.convertStockToString(.kiwi)
    self.mangoCountLabel.text = self.convertStockToString(.mango)
  }
  
  func convertStockToString(_ fruit: Fruit) -> String {
    guard let fruitAmount = self.juiceMaker?.fruitStore.stock[fruit] else {
      return String(Int.zero)
    }
    return String(fruitAmount)
  }
  
  func updateStepper() {
    self.strawberryStepper.value = self.convertStockToDouble(.strawberry)
    self.bananaStepper.value = self.convertStockToDouble(.banana)
    self.pineappleStepper.value = self.convertStockToDouble(.pineapple)
    self.kiwiStepper.value = self.convertStockToDouble(.kiwi)
    self.mangoStepper.value = self.convertStockToDouble(.mango)
  }
  
  func convertStockToDouble(_ fruit: Fruit) -> Double {
    guard let fruitAmount = self.juiceMaker?.fruitStore.stock[fruit] else {
      return Double.zero
    }
    return Double(fruitAmount)
  }
  
}
