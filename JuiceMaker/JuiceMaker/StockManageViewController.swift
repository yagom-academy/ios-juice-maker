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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showFruitsStock()
        setStepper()
    }
    
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
    
    private func showFruitsStock() {
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
            pineappleStockLabel.text = String(pineappleStock)
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
        }
    
    private func setFruitStock() {
            JuiceMaker.common.stockManager.strawberry.add(stock: Int(strawberryStepper.value) - strawberryStock)
            JuiceMaker.common.stockManager.banana.add(stock: Int(bananaStepper.value) - bananaStock)
            JuiceMaker.common.stockManager.pineapple.add(stock: Int(pineappleStepper.value) - pineappleStock)
            JuiceMaker.common.stockManager.kiwi.add(stock: Int(kiwiStepper.value) - kiwiStock)
            JuiceMaker.common.stockManager.mango.add(stock: Int(mangoStepper.value) - mangoStock)
        }
    
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
    }
        
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
    }
        
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
    }
        
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
    }
        
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func touchUpGoBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
