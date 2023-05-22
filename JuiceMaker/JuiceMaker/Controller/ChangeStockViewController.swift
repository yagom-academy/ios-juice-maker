//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Erick, JusBug on 2023/05/19.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    static let id = "ChangeStockViewControllerID"
    var fruitStore = FruitStore()
    var delegate: ChangeStockDelegate?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        setText()
        setStepperValue()
        setStepperTag()
    }
    
    @IBAction private func tapCloseButton(_ sender: UIBarButtonItem) {
        self.delegate?.changeStock(fruitStore: fruitStore)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func changeStockStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        let amount = Int(sender.value)
        
        guard amount >= 0 else {
            sender.value = 0
            popUpNonChangeableAlert()
            return
        }
        
        fruitStore.changeStock(amount, to: fruit)
        setText()
    }
    
    private func setText() {
        strawberryStockLabel.text = String(fruitStore.bringStock(.strawberry))
        bananaStockLabel.text = String(fruitStore.bringStock(.banana))
        pineappleStockLabel.text = String(fruitStore.bringStock(.pineapple))
        kiwiStockLabel.text = String(fruitStore.bringStock(.kiwi))
        mangoStockLabel.text = String(fruitStore.bringStock(.mango))
    }
    
    private func setStepperValue() {
        strawberryStockStepper.value = Double(fruitStore.bringStock(.strawberry))
        bananaStockStepper.value = Double(fruitStore.bringStock(.banana))
        pineappleStockStepper.value = Double(fruitStore.bringStock(.pineapple))
        kiwiStockStepper.value = Double(fruitStore.bringStock(.kiwi))
        mangoStockStepper.value = Double(fruitStore.bringStock(.mango))
        
        strawberryStockStepper.minimumValue = -1
        bananaStockStepper.minimumValue = -1
        pineappleStockStepper.minimumValue = -1
        kiwiStockStepper.minimumValue = -1
        mangoStockStepper.minimumValue = -1
    }
    
    private func setStepperTag() {
        strawberryStockStepper.tag = 0
        bananaStockStepper.tag = 1
        pineappleStockStepper.tag = 2
        kiwiStockStepper.tag = 3
        mangoStockStepper.tag = 4
    }
    
    private func popUpNonChangeableAlert() {
        let alertMessage = makeAlertMessage("변경불가", "재고가 이미 0입니다.", actionTitle: "예", actionType: .default)
        present(alertMessage, animated: true)
    }
}
