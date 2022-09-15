//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Kyo, Hamo on 2022/09/02.
//

import UIKit

protocol ModifyStockDelegate: AnyObject {
    func changeFruitStock(_ changedStock: [Fruit : Int])
}

class ModifyStockViewController: UIViewController {
    var fruitStock: [Fruit : Int] = [:]
    private var fruitUIAttribute: [Fruit : (label: UILabel, stepper: UIStepper, isChange: Bool)] = [:]
    weak var delegate: ModifyStockDelegate?
                                                     
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setFruitUIAttribute()
        setFruitStockLabel()
        setStepperValue()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let changeFruit = Fruit.findFruiteStepperTag(location: sender.tag) else {
            return
        }
        
        fruitUIAttribute[changeFruit]?.label.text = Int(sender.value).description
        fruitUIAttribute[changeFruit]?.isChange = true
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        var changeFruitStock: [Fruit : Int] = [:]
        for (key, value) in fruitUIAttribute {
            guard value.isChange else {
                continue
            }
            
            changeFruitStock[key] = Int(value.label.text ?? String(ConstantUsageFruit.invalidFruit))
        }
        
        delegate?.changeFruitStock(changeFruitStock)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setFruitUIAttribute() {
        fruitUIAttribute = [.strawberry : (strawberryStockLabel, strawberryStepper, false),
                            .banana : (bananaStockLabel, bananaStepper, false),
                            .pineapple : (pineappleStockLabel, pineappleStepper, false),
                            .kiwi : (kiwiStockLabel, kiwiStepper, false),
                            .mango : (mangoStockLabel, mangoStepper, false)]
    }
    
    private func setNavigationBar() {
        self.title = ConstantSentence.modifyStockTitle
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 242/255,
                                                                           green: 242/255,
                                                                           blue: 242/255,
                                                                           alpha: 1.0)
    }
    
    private func setFruitStockLabel() {
        for (key, value) in fruitUIAttribute {
            value.label.text = String(fruitStock[key, default: ConstantUsageFruit.invalidFruit])
        }
    }
    
    private func setStepperValue() {
        for (key, value) in fruitUIAttribute {
            value.stepper.value = Double(fruitStock[key, default: ConstantUsageFruit.invalidFruit])
        }
    }
}
