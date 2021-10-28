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
        do {
            for fruitCountLabel in fruitCountLabels {
                guard let fruitID = fruitCountLabel.restorationIdentifier else {
                    throw FruitError.notFoundID(self,"UILabel")
                }
                guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitID) else {
                    throw FruitError.notFoundFruitCount
                }
                fruitCountLabel.text = String(fruitCount)
            }
        } catch {
            print("ERROR \(error): \(error.localizedDescription)")
        }
    }
    
    func setStepperValue() {
        do {
            for fruitStepper in fruitSteppers {
                guard let fruitStepperID = fruitStepper.restorationIdentifier else {
                    throw FruitError.notFoundID(self,"UIStepper")
                }
                guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitStepperID) else {
                    throw FruitError.notFoundFruitCount
                }
                fruitStepper.value = Double(fruitCount)
            }
        } catch {
            print("ERROR \(error): \(error.localizedDescription)")
        }
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        do {
            guard let fruitStepperID = sender.restorationIdentifier else {
                throw FruitError.notFoundID(self,"UIStepper")
            }
            guard let previousFruitCount = FruitStore.shared.getFruitCount(by: fruitStepperID) else {
                throw FruitError.notFoundFruitCount
            }
            guard let fruit = FruitStore.Fruits.findFruit(by: fruitStepperID) else {
                throw FruitError.notFoundFruit
            }
            
            if previousFruitCount - Int(sender.value) > 0 {
                FruitStore.shared.subtract(fruit: fruit, of: Int(sender.stepValue))
            } else {
                FruitStore.shared.add(fruit: fruit, of: Int(sender.stepValue))
            }
        } catch {
            print("ERROR \(error): \(error.localizedDescription)")
        }
    }
    
}
