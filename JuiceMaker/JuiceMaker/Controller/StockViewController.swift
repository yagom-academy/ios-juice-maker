//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by song on 2022/02/28.
//

import UIKit

final class StockViewController: UIViewController {
  
  static let identifier = String(describing: StockViewController.self)
  
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func didStepperValueChanged(_ sender: UIStepper) {}
}
