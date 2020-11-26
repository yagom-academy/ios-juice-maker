//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 임리나 on 2020/11/23.
//

import UIKit

class StockViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    let strawberry = JuiceMaker.common.fruits[.strawberry]
    let banana = JuiceMaker.common.fruits[.banana]
    let mango = JuiceMaker.common.fruits[.mango]
    let kiwi = JuiceMaker.common.fruits[.kiwi]
    let pineapple = JuiceMaker.common.fruits[.pineapple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()        
    }
    
    @IBAction func touchUpDismissPageButton() {
        self.dismiss(animated: true, completion: nil)
        
        let strawberryAmount = UInt(strawberryStockLabel.text!)! - strawberry!.amount
        let bananaAmount = UInt(bananaStockLabel.text!)! - banana!.amount
        let mangoAmount = UInt(mangoStockLabel.text!)! - mango!.amount
        let kiwiAmount = UInt(kiwiStockLabel.text!)! - kiwi!.amount
        let pineappleAmount = UInt(pineappleStockLabel.text!)! - pineapple!.amount
        
        strawberry?.supply(amount: strawberryAmount)
        banana?.supply(amount: bananaAmount)
        mango?.supply(amount: mangoAmount)
        kiwi?.supply(amount: kiwiAmount)
        pineapple?.supply(amount: pineappleAmount)
    }
    
    func makeStepperValueChanged(fruit: FruitName, sender: UIStepper) {
        let inputValue = UInt(sender.value)
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(strawberry!.amount + inputValue)
        case .banana:
            bananaStockLabel.text = String(banana!.amount + inputValue)
        case .mango:
            mangoStockLabel.text = String(mango!.amount + inputValue)
        case .kiwi:
            kiwiStockLabel.text = String(kiwi!.amount + inputValue)
        case .pineapple:
            pineappleStockLabel.text = String(pineapple!.amount + inputValue)
        }
    }
    
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        makeStepperValueChanged(fruit: .strawberry, sender: sender)
    }
    
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        makeStepperValueChanged(fruit: .banana, sender: sender)
    }
    
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        makeStepperValueChanged(fruit: .kiwi, sender: sender)
    }
    
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        makeStepperValueChanged(fruit: .mango, sender: sender)
    }
    
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        makeStepperValueChanged(fruit: .pineapple, sender: sender)
    }
    
    func updateFruitStockLabel() {
        strawberryStockLabel.text = String(strawberry?.amount ?? 0)
        bananaStockLabel.text = String(banana?.amount ?? 0)
        mangoStockLabel.text = String(mango?.amount ?? 0)
        kiwiStockLabel.text = String(kiwi?.amount ?? 0)
        pineappleStockLabel.text = String(pineapple?.amount ?? 0)
    }
}

