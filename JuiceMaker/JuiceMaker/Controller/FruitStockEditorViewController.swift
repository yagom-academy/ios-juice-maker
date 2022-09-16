//  Created by 애종,질리,벨라 on 2022/09/06.

import UIKit

class FruitStockEditorViewController: UIViewController {
    
    @IBOutlet weak var mutableStrawberryAmountLabel: UILabel!
    @IBOutlet weak var mutableBananaAmountLabel: UILabel!
    @IBOutlet weak var mutablePineappleAmountLabel: UILabel!
    @IBOutlet weak var mutableKiwiAmountLabel: UILabel!
    @IBOutlet weak var mutableMangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryAmountStepper: UIStepper!
    @IBOutlet weak var bananaAmountStepper: UIStepper!
    @IBOutlet weak var pineappleAmountStepper: UIStepper!
    @IBOutlet weak var kiwiAmountStepper: UIStepper!
    @IBOutlet weak var mangoAmountStepper: UIStepper!
    
    var delegate: FruitStockDelegate?
    
    var editingFruitStock: FruitStock = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewComponent(with: editingFruitStock)
    }
    
    func updateViewComponent(with currentStockValue: FruitStock) {
        for target in currentStockValue {
            updateLabelAndStepperValue(amount: target.value, type: target.key)
        }
    }
    
    func updateLabelAndStepperValue(amount: Int, type: Fruit) {
        switch type {
        case .strawberry:
            mutableStrawberryAmountLabel.text = "\(amount)"
            updateStepperValue(stepper: strawberryAmountStepper, amount: amount)
        case .banana:
            mutableBananaAmountLabel.text = "\(amount)"
            updateStepperValue(stepper: bananaAmountStepper, amount: amount)
        case .kiwi:
            mutableKiwiAmountLabel.text = "\(amount)"
            updateStepperValue(stepper: kiwiAmountStepper, amount: amount)
        case .pineapple:
            mutablePineappleAmountLabel.text = "\(amount)"
            updateStepperValue(stepper: pineappleAmountStepper, amount: amount)
        case .mango:
            mutableMangoAmountLabel.text = "\(amount)"
            updateStepperValue(stepper: mangoAmountStepper, amount: amount)
        }
    }
    
    func updateStepperValue(stepper: UIStepper, amount: Int) {
        stepper.value = Double(amount)
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchupStrawberryAmountStepper(_ sender: UIStepper) {
        editingFruitStock.updateValue(Int(sender.value), forKey: .strawberry)
        mutableStrawberryAmountLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func touchupBananaAmountStepper(_ sender: UIStepper) {
        editingFruitStock.updateValue(Int(sender.value), forKey: .banana)
        mutableBananaAmountLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func touchupPineappleAmountStepper(_ sender: UIStepper) {
        editingFruitStock.updateValue(Int(sender.value), forKey: .pineapple)
        mutablePineappleAmountLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func touchupKiwiAmountStepper(_ sender: UIStepper) {
        editingFruitStock.updateValue(Int(sender.value), forKey: .kiwi)
        mutableKiwiAmountLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func touchupMangoAmountStepper(_ sender: UIStepper) {
        editingFruitStock.updateValue(Int(sender.value), forKey: .mango)
        mutableMangoAmountLabel.text = "\(Int(sender.value))"
    }
}
