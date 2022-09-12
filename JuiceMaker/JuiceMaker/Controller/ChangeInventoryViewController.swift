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
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func actionStepper(_ sender: UIStepper) {
        guard let fruitLabel = takeFruitLabel(of: sender) else { return }
        fruitLabel.text = Int(sender.value).description
//        checkStepperValue(of: sender)
    }
    
    @IBAction private func closeButton(_ sender: UIButton) {
        updateInventory()
        dismiss(animated: true,
                completion: nil)
    }
    
    func takeFruitLabel(of sender: UIStepper) -> UILabel? {
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
    
    func checkStepperValue() {
        guard let strawberryValue = Double(juiceMaker.checkStock(of: .strawBerry) ?? "0") else { return }
        guard let bananaValue = Double(juiceMaker.checkStock(of: .banana) ?? "0") else { return }
        guard let pineAppleValue = Double(juiceMaker.checkStock(of: .pineApple) ?? "0") else { return }
        guard let kiwiValue = Double(juiceMaker.checkStock(of: .kiwi) ?? "0") else { return }
        guard let mangoValue = Double(juiceMaker.checkStock(of: .mango) ?? "0") else { return }
        strawberryStepper.value = strawberryValue
        bananaStepper.value = bananaValue
        pineappleStepper.value = pineAppleValue
        kiwiStepper.value = kiwiValue
        mangoStepper.value = mangoValue
   
//        guard let fruitValue = Double(takeFruitLabel(of: sender)?.text ?? "99" ) else { return }
//        sender.value = fruitValue
    }
    
    func updateInventory() {
        guard let strawberryAmount = Int(strawberryStockLabel.text ?? "0") else { return }
        guard let bananaAmount = Int(bananaStockLabel.text ?? "0") else { return }
        guard let pineappleAmount = Int(pineappleStockLabel.text ?? "0") else { return }
        guard let kiwiAmount = Int(kiwiStockLabel.text ?? "0") else { return }
        guard let mangoAmount = Int(mangoStockLabel.text ?? "0") else { return }
        
        JuiceMaker.store.inventory[.strawBerry] = strawberryAmount
        JuiceMaker.store.inventory[.banana] = bananaAmount
        JuiceMaker.store.inventory[.pineApple] = pineappleAmount
        JuiceMaker.store.inventory[.kiwi] = kiwiAmount
        JuiceMaker.store.inventory[.mango] = mangoAmount
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
