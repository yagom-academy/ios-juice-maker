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
        
        // 레이블 설정해주는거 (과일)
        
        // 카운트 설정
        
        // stepper FruitID
        
        updateFruitCount()
        registerNotificationCenter()
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    func registerNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: NotificationCenterName.changedInventory,
            object: nil
        )
    }
    
    @objc
    private func updateFruitCount() {
        do {
            for (fruit, count) in FruitStore.shared.fruitInventory {
                guard let label = fruitCountLabels.filter({
                    compare(fruit,by: $0.restorationIdentifier) }).first else {
                    throw FruitError.notFoundView(self, "Label")
                }
                guard let stepper = fruitSteppers.filter({
                    compare(fruit,by: $0.restorationIdentifier) }).first else {
                    throw FruitError.notFoundView(self, "Stepper")
                }
                label.text = String(count)
                stepper.value = Double(count)
            }
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        do {
            guard let (fruit, previousFruitCount) = FruitStore.shared.fruitInventory.filter({
                compare($0.key, by: sender.restorationIdentifier) }).first else {
                throw FruitError.notFoundView(self, "Stepper")
            }
            
            if previousFruitCount - Int(sender.value) > 0 {
                FruitStore.shared.subtract(fruit: fruit, of: Int(sender.stepValue))
            } else {
                FruitStore.shared.add(fruit: fruit, of: Int(sender.stepValue))
            }
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    private func compare(_ fruit: Fruits, by fruitID: String?) -> Bool {
        guard let fruitID = fruitID, let foundfruit = Fruits.findFruit(by: fruitID) else {
            return false
        }
        return fruit == foundfruit
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NotificationCenterName.changedInventory,
            object: nil
        )
    }
}
