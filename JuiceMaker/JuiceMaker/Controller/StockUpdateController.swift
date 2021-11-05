//
//  StockUpdateController.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/28.
//

import UIKit

class StockUpdateController: UIViewController {
    
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    var stockOfFruit: [Fruit: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialValueForLabel()
        setInitialValueForStepper()
    }
    
    private func setInitialValueForLabel() {
        stockOfFruit.forEach({ (fruit, stock) in
          updateFruitLabel(for: fruit, stock: stock)
        })
    }
    
    private func setInitialValueForStepper() {
        for stepper in fruitSteppers {
            if let fruit = Fruit(rawValue: stepper.tag),
               let value = stockOfFruit[fruit] {
                stepper.value = Double(value)
            }
        }
    }
    
    private func updateFruitStockFromStepper() {
        for stepper in fruitSteppers {
            if let fruit = Fruit(rawValue: stepper.tag) {
                stockOfFruit[fruit] = Int(stepper.value)
            }
        }
    }
    
    @IBAction private func tapFruitStepper(_ sender: UIStepper) {
        do {
            guard let fruit = Fruit(rawValue: sender.tag) else {
                throw JuiceMakerError.invalidTagNumberForStepper
            }
            let stepperValue = Int(sender.value)
            updateFruitLabel(for: fruit, stock: stepperValue)
        } catch JuiceMakerError.invalidTagNumberForStepper {
            print(JuiceMakerError.invalidTagNumberForStepper.description)
        } catch {
            print(error)
        }
    }
    
    private func updateFruitLabel(for fruit: Fruit, stock: Int) {
        for label in stockLabels {
            if label.tag == fruit.rawValue {
                label.text = String(stock)
            }
        }
    }
    
    @IBAction private func tapExitButton(_ sender: UIBarButtonItem) {
        updateFruitStockFromStepper()
        notificationCenter.post(name: Notification.Name.stockModified,
                                object: nil,
                                userInfo: [NotificationKey.stockOfFruit: self.stockOfFruit])
        dismiss(animated: true, completion: nil)
    }
}
