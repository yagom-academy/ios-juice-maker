//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by parkhyo on 2022/09/02.
//

import UIKit

class ModifyStockViewController: UIViewController {
    var fruitStock: [Fruit : Int] = [:]
    
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
    
    lazy var fruitLabel: [(label: UILabel, stepper: UIStepper)] = [(strawberryStockLabel, strawberryStepper),
        (bananaStockLabel, bananaStepper),
        (pineappleStockLabel, pineappleStepper),
        (kiwiStockLabel, kiwiStepper),
        (mangoStockLabel, mangoStepper),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        settingFruitStockLabel()
        settingStepperValue()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        fruitLabel[sender.tag].label.text = Int(sender.value).description
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.modifyStockTitle
        self.navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
    func settingFruitStockLabel() {
        strawberryStockLabel.text = String(fruitStock[.strawberry, default: ConstantUsageFruit.invalidFruit])
        bananaStockLabel.text = String(fruitStock[.banana, default: ConstantUsageFruit.invalidFruit])
        pineappleStockLabel.text = String(fruitStock[.pineapple, default: ConstantUsageFruit.invalidFruit])
        kiwiStockLabel.text = String(fruitStock[.kiwi, default: ConstantUsageFruit.invalidFruit])
        mangoStockLabel.text = String(fruitStock[.mango, default: ConstantUsageFruit.invalidFruit])
    }
    
    func settingStepperValue() {
        strawberryStepper.value = Double(fruitStock[.strawberry, default: ConstantUsageFruit.invalidFruit])
        bananaStepper.value = Double(fruitStock[.banana, default: ConstantUsageFruit.invalidFruit])
        pineappleStepper.value = Double(fruitStock[.pineapple, default: ConstantUsageFruit.invalidFruit])
        kiwiStepper.value = Double(fruitStock[.kiwi, default: ConstantUsageFruit.invalidFruit])
        mangoStepper.value = Double(fruitStock[.mango, default: ConstantUsageFruit.invalidFruit])
    }
}

extension Notification.Name {
    static let stock = Notification.Name("stock")
}
