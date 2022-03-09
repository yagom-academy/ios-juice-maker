//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by song on 2022/02/28.
//

import UIKit

final class StockViewController: UIViewController {
  
  @IBOutlet private var fruitCountLabels: [UILabel]!
  @IBOutlet private var fruitSteppers: [UIStepper]!
  
  var juiceMaker: JuiceMaker?
  weak var delegate: StockDelegate?
  
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
    return Fruit(rawValue: sender.tag)
  }
  
  func updateLabel() {
    for (label, fruit) in zip(fruitCountLabels, Fruit.allCases) {
      if let fruitAmount = self.juiceMaker?.fruitStore.stock[fruit] {
        label.text = String(fruitAmount)
      } else {
        label.text = String(Int.zero)
      }
    }
  }
  
  func updateStepper() {
    for (stepper, fruit) in zip(fruitSteppers, Fruit.allCases) {
      if let fruitAmount = self.juiceMaker?.fruitStore.stock[fruit] {
        stepper.value = Double(fruitAmount)
      } else {
        stepper.value = Double.zero
      }
    }
  }
}
