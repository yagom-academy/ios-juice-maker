//
//  OrderViewController.swift
//  JuiceMaker
//
//  Created by jaeyoung Yun on 2022/02/16.
//

import UIKit

class OrderViewController: UIViewController {
  
  @IBOutlet weak var changeStockBarButton: UIBarButtonItem!
  
  @IBOutlet weak var strawberryStockLabel: UILabel!
  @IBOutlet weak var bananaStockLabel: UILabel!
  @IBOutlet weak var pineappleStockLabel: UILabel!
  @IBOutlet weak var kiwiStockLabel: UILabel!
  @IBOutlet weak var mangoStockLabel: UILabel!
  
  @IBOutlet weak var orderStrawberryBananaJuiceButton: UIButton!
  @IBOutlet weak var orderStrawberryJuiceButton: UIButton!
  @IBOutlet weak var orderBananaJuiceButton: UIButton!
  @IBOutlet weak var orderPineappleJuiceButton: UIButton!
  @IBOutlet weak var orderKiwiJuiceButton: UIButton!
  @IBOutlet weak var orderMangoJuiceButton: UIButton!
  @IBOutlet weak var orderMangoKiwiJuiceButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
