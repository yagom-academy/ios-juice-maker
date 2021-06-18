//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Terry Lee on 2021/06/15.
//

import UIKit

class ChangeStockViewController: ViewController {
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var delegate: StockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStepperInitialValue()
    }
    
    func setStepperInitialValue() {
        do {
            strawberryStepper.value = try juiceMaker.returnStockDouble(of: .strawberry)
            bananaStepper.value = try juiceMaker.returnStockDouble(of: .banana)
            pineappleStepper.value = try juiceMaker.returnStockDouble(of: .pineapple)
            kiwiStepper.value = try juiceMaker.returnStockDouble(of: .kiwi)
            mangoStepper.value = try juiceMaker.returnStockDouble(of: .mango)
        } catch {
            return
        }
    }
    
    @IBAction func changeFruitStock(_ sender: UIStepper) {
        guard let fruitName = sender.restorationIdentifier, let fruit = Fruit(rawValue: fruitName) else {
            return
        }
        juiceMaker.fruitStore.fruits[fruit] = Int(sender.value)
        updateStockLabels()
    }
    
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        delegate?.stockDidChange(self)
    }
}
