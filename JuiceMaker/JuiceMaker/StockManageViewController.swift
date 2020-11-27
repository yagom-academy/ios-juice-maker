//
//  StockManageViewController.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/19.
//

import UIKit

class StockManageViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    private var strawberryStock : Int = JuiceMaker.common.stockManager.strawberry.stock
    private var bananaStock: Int = JuiceMaker.common.stockManager.banana.stock
    private var pineappleStock: Int = JuiceMaker.common.stockManager.pineapple.stock
    private var kiwiStock: Int = JuiceMaker.common.stockManager.kiwi.stock
    private var mangoStock: Int = JuiceMaker.common.stockManager.mango.stock
    
    private func setStepper() {
            strawberryStepper.value = Double(strawberryStock)
            strawberryStepper.minimumValue = 0
            bananaStepper.value = Double(bananaStock)
            bananaStepper.minimumValue = 0
            pineappleStepper.value = Double(pineappleStock)
            pineappleStepper.minimumValue = 0
            kiwiStepper.value = Double(kiwiStock)
            kiwiStepper.minimumValue = 0
            mangoStepper.value = Double(mangoStock)
            mangoStepper.minimumValue = 0
        }
    
    @IBAction func touchUpGoBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
