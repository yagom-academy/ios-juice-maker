//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by Minseong Kang on 2022/05/02.
//

import UIKit

final class InventoryViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var strawberryInventoryLabel: UILabel!
    @IBOutlet private weak var bananaInventoryLabel: UILabel!
    @IBOutlet private weak var pineappleInventoryLabel: UILabel!
    @IBOutlet private weak var kiwiInventoryLabel: UILabel!
    @IBOutlet private weak var mangoInventoryLabel: UILabel!
    
    @IBOutlet private weak var strawberryInventoryStepper: UIStepper!
    @IBOutlet private weak var bananaInventoryStepper: UIStepper!
    @IBOutlet private weak var pineappleInventoryStepper: UIStepper!
    @IBOutlet private weak var kiwiInventoryStepper: UIStepper!
    @IBOutlet private weak var mangoInventoryStepper: UIStepper!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialInventoryLabels()
        giveStepperFruitsInventory()
    }
}

// MARK: - Action

extension InventoryViewController {
    @IBAction private func updateInventoryLabels(_ sender: UIStepper) {
        switch sender {
        case strawberryInventoryStepper:
            strawberryInventoryLabel.text = Int(sender.value).description
        case bananaInventoryStepper:
            bananaInventoryLabel.text = Int(sender.value).description
        case pineappleInventoryStepper:
            pineappleInventoryLabel.text = Int(sender.value).description
        case kiwiInventoryStepper:
            kiwiInventoryLabel.text = Int(sender.value).description
        case mangoInventoryStepper:
            mangoInventoryLabel.text = Int(sender.value).description
        default:
            break
        }
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        JuiceMaker.shared.store.applyChangesToFruitsInventory(from: saveInventoryModifiedByStepper())
    }
    
    private func saveInventoryModifiedByStepper() -> [FruitStore.Fruit: Int] {
        var modifiedInventory: [FruitStore.Fruit: Int] = [:]
    
        FruitStore.Fruit.allCases.forEach { modifiedInventory[$0] = 0 }
        
        modifiedInventory[.strawberry] = Int(strawberryInventoryStepper.value)
        modifiedInventory[.banana] = Int(bananaInventoryStepper.value)
        modifiedInventory[.pineapple] = Int(pineappleInventoryStepper.value)
        modifiedInventory[.kiwi] = Int(kiwiInventoryStepper.value)
        modifiedInventory[.mango] = Int(mangoInventoryStepper.value)
        
        return modifiedInventory
    }
    
    private func giveStepperFruitsInventory() {
        strawberryInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? 0)
        bananaInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.banana] ?? 0)
        pineappleInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? 0)
        kiwiInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? 0)
        mangoInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.mango] ?? 0)
    }
    
    private func setInitialInventoryLabels() {
        let errorValue = -1
        strawberryInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? errorValue)
        bananaInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.banana] ?? errorValue)
        pineappleInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? errorValue)
        kiwiInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? errorValue)
        mangoInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.mango] ?? errorValue)
    }
}
