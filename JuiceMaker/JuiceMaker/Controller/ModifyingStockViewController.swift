//
//  ModifyingStockViewController.swift
//  JuiceMaker
//
//  Created by 조민호 on 2022/02/25.
//

import UIKit

final class ModifyingStockViewController: UIViewController {
    private var fruitStore: FruitStore?
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        updateLabel(stepper: sender)
    }
    
    static func instance(fruitStore: FruitStore) -> ModifyingStockViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyborad.instantiateViewController(withIdentifier: String(describing: self)) as? ModifyingStockViewController else {
            return ModifyingStockViewController()
        }
        viewController.fruitStore = fruitStore
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func updateLabel(stepper: UIStepper) {
        let label = findLabel(stepper: stepper)
        label.text = String(Int(stepper.value))
    }
    
    private func findLabel(stepper: UIStepper) -> UILabel {
        switch stepper {
        case strawberryStepper:
            return strawberryAmountLabel
        case bananaStepper:
            return bananaAmountLabel
        case pineappleStepper:
            return pineappleAmountLabel
        case kiwiStepper:
            return kiwiAmountLabel
        case mangoStepper:
            return mangoAmountLabel
        default:
            return strawberryAmountLabel
        }
    }
}
