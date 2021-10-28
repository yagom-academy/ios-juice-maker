//
//  ModifyInventoryViewController.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/10/26.
//

import UIKit

class ModifyInventoryViewController: UIViewController {
    
    typealias Fruits = FruitStore.Fruits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitCount()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: Notification.Name("changedInventory"),
            object: nil
        )
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    @objc
    func updateFruitCount() {
        for (fruitName, count) in FruitStore.shared.fruitInventory {
            guard let label = fruitCountLabels.filter({ compare(fruitName, $0.restorationIdentifier) }).first else {
                return
            }
            guard let stepper = fruitSteppers.filter({ compare(fruitName, $0.restorationIdentifier) }).first else {
                return
            }
            
            label.text = String(count)
            stepper.value = Double(count)
        }
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        guard let (fruitName, previousFruitCount) = FruitStore.shared.fruitInventory.filter({ compare($0.key, sender.restorationIdentifier) }).first else {
            return
        }
        
        if previousFruitCount - Int(sender.value) > 0 {
            FruitStore.shared.subtract(fruit: fruitName, of: Int(sender.stepValue))
        } else {
            FruitStore.shared.add(fruit: fruitName, of: Int(sender.stepValue))
        }
    }
    
    private func compare(_ lhs: Fruits, _ rhs: String?) -> Bool {
        guard let id = rhs, let fruit = Fruits.findFruit(by: id) else {
            return false
        }
        return lhs == fruit
    }
    
}
