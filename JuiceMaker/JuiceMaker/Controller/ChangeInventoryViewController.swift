//
//  ChangeInventoryViewController.swift
//  JuiceMaker
//
//  Created by Mene, Dragon on 2022/09/02.
//

import UIKit

class ChangeInventoryViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    @IBAction private func closeButton(_ sender: UIButton) {
        dismiss(animated: true,
                completion: nil)
    }
    
    @IBAction private func setFruitStock(_ sender: UIStepper) {
        guard let fruit = takeFruit(of: sender) else { return }
        guard let fruitLabel = takeFruitLabel(of: sender) else { return }
        fruitLabel.text = Int(sender.value).description
        JuiceMaker.store.inventory[fruit] = Int(sender.value)
    }
    
    private func takeFruitLabel(of sender: UIStepper) -> UILabel? {
        switch sender {
        case strawberryStepper:
            return strawberryStockLabel
        case bananaStepper:
            return bananaStockLabel
        case pineappleStepper:
            return pineappleStockLabel
        case kiwiStepper:
            return kiwiStockLabel
        case mangoStepper:
            return mangoStockLabel
        default:
            return nil
        }
    }
    
    private func takeFruit(of sender: UIStepper) -> Fruit? {
        switch sender {
        case strawberryStepper:
            return .strawBerry
        case bananaStepper:
            return .banana
        case pineappleStepper:
            return .pineApple
        case kiwiStepper:
            return .kiwi
        case mangoStepper:
            return .mango
        default:
            return nil
        }
    }
    
    private func checkStepperValue() {
        strawberryStepper.value = Double(JuiceMaker.store.inventory[.strawBerry] ?? 0)
        bananaStepper.value = Double(JuiceMaker.store.inventory[.banana] ?? 0)
        pineappleStepper.value = Double(JuiceMaker.store.inventory[.pineApple] ?? 0)
        kiwiStepper.value = Double(JuiceMaker.store.inventory[.kiwi] ?? 0)
        mangoStepper.value = Double(JuiceMaker.store.inventory[.mango] ?? 0)
    }
    
    private func checkInventory() {
        strawberryStockLabel.text = juiceMaker.checkStock(of: .strawBerry)
        bananaStockLabel.text = juiceMaker.checkStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.checkStock(of: .pineApple)
        kiwiStockLabel.text = juiceMaker.checkStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.checkStock(of: .mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInventory()
        checkStepperValue()
    }
}
