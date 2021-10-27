//
//  ModifyInventoryViewController.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/10/26.
//

import UIKit

class ModifyInventoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitCount()
        setStepperValue()
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
        
        for fruitCountLabel in fruitCountLabels {
            
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            
            guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitID) else {
                return
            }
            
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    func setStepperValue() {
        for stepper in fruitSteppers {
            guard let fruitStepperID = stepper.restorationIdentifier else {
                return
            }
            
            guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitStepperID) else {
                return
            }
            stepper.value = Double(fruitCount)
        }
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        print(sender.stepValue)
        guard let fruitStepperID = sender.restorationIdentifier else {
            return
        }
        guard let previousFruitCount = FruitStore.shared.getFruitCount(by: fruitStepperID) else {
            return
        }
        guard let fruit = FruitStore.Fruits.findFruit(by: fruitStepperID) else {
            return
        }
        
        print(sender.value)
        print(previousFruitCount)
        
        if previousFruitCount - Int(sender.value) > 0 {
            FruitStore.shared.subtract(fruit: fruit, of: Int(sender.stepValue))
        } else {
            FruitStore.shared.add(fruit: fruit, of: Int(sender.stepValue))
        }
        
        print(FruitStore.shared.inventoryStatus)
        
    }
    
}
