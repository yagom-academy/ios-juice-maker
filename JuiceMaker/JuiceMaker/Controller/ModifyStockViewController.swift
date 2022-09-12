//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Kyo, Hamo on 2022/09/02.
//

import UIKit

class ModifyStockViewController: UIViewController {
    var fruitStock: [Fruit : Int] = [:]
    lazy var fruitLabel: [Fruit : (label: UILabel, stepper: UIStepper, isChange: Bool)] =
                                                     [.strawberry : (strawberryStockLabel, strawberryStepper, false),
                                                      .banana : (bananaStockLabel, bananaStepper, false),
                                                      .pineapple : (pineappleStockLabel, pineappleStepper, false),
                                                      .kiwi : (kiwiStockLabel, kiwiStepper, false),
                                                      .mango : (mangoStockLabel, mangoStepper, false)]

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
        setFruitStockLabel()
        setStepperValue()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let changeFruit = Fruit(rawValue: sender.tag) else {
            return
        }
        
        fruitLabel[changeFruit]?.label.text = Int(sender.value).description
        fruitLabel[changeFruit]?.isChange = true
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        var changeFruitStock: [Fruit : Int] = [:]
        
        for (key, value) in fruitLabel {
            guard value.isChange else {
                continue
            }
            
            changeFruitStock[key] = Int(value.label.text ?? String(ConstantUsageFruit.invalidFruit))
        }
        
        NotificationCenter.default.post(name: Notification.Name.stock, object: nil, userInfo: changeFruitStock)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.modifyStockTitle
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    func setFruitStockLabel() {
        for (key, value) in fruitLabel {
            value.label.text = String(fruitStock[key, default: ConstantUsageFruit.invalidFruit])
        }
    }
    
    func setStepperValue() {
        for (key, value) in fruitLabel {
            value.stepper.value = Double(fruitStock[key, default: ConstantUsageFruit.invalidFruit])
        }
    }
}

extension Notification.Name {
    static let stock = Notification.Name("stock")
}
