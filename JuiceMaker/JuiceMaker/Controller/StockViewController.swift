//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by song on 2022/02/28.
//

import UIKit

final class StockViewController: UIViewController {
  
  @IBOutlet weak var strawberryCountLabel: UILabel!
  @IBOutlet weak var bananaCountLabel: UILabel!
  @IBOutlet weak var pineappleCountLabel: UILabel!
  @IBOutlet weak var kiwiCountLabel: UILabel!
  @IBOutlet weak var mangoCountLabel: UILabel!
  
  @IBOutlet weak var strawberryStepper: UIStepper!
  @IBOutlet weak var bananaStepper: UIStepper!
  @IBOutlet weak var pineappleStepper: UIStepper!
  @IBOutlet weak var kiwiStepper: UIStepper!
  @IBOutlet weak var mangoStepper: UIStepper!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didStepperValueChanged(_ sender: UIStepper) {}
}
