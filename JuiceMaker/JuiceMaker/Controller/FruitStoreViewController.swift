//
//  FruitStoreVC.swift
//  JuiceMaker
//
//  Created by hyunMac on 2023/09/15.
//

import UIKit

final class FruitStoreViewController: UIViewController {
    @IBOutlet private var fruitCountLabels: [UILabel]!
    @IBOutlet private var fruitSteppers: [UIStepper]!
    
    var fruitList: [Fruit: Int] = [:]
    var delegate: manageStockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruitCollection()
        initStock()
    }
    
    private func initFruitCollection() {
        fruitCountLabels.sort(by: {$0.tag < $1.tag})
        fruitSteppers.sort(by: {$0.tag < $1.tag})
        
        for (index, stepper) in fruitSteppers.enumerated() {
            guard let fruit = Fruit(rawValue: index) else {
                return
            }
            guard let fruitStock = fruitList[fruit] else {
                return
            }

            stepper.value = Double(fruitStock)
            stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        }
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else {
            return
        }
        
        fruitCountLabels[sender.tag].text = Int(sender.value).description
        fruitList[fruit] = Int(sender.value)
    }
    
    private func initStock() {
        for (index, label) in fruitCountLabels.enumerated() {
            guard let fruit = Fruit(rawValue: index) else {
                return
            }
            guard let fruitStock = fruitList[fruit] else {
                return
            }
            
            label.text = String(fruitStock)
        }
    }
    
    @IBAction private func touchUpInsideDismissFruitStore(_ sender: UIButton) {
        delegate?.updateStock(fruitList: fruitList)
        dismiss(animated: true)
    }
}
