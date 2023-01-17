//  JuiceMaker - FruitStockViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.06


import UIKit

final class FruitStockViewController: UIViewController {
    
    static let identifier = "FruitStockViewController"

    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    private var fruits: [Fruit: Int] = [:]
    weak var delegate: UpdatableFruitStock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        setLabelAndStepperValue()
    }
    
    func setFruits(_ fruits: [Fruit: Int]) {
        self.fruits = fruits
    }
    
    private func setLabelAndStepperValue() {
        guard let strawberryStock = fruits[.strawberry],
              let bananaStock = fruits[.banana],
              let kiwiStock = fruits[.kiwi],
              let pineappleStock = fruits[.pineapple],
              let mangoStock = fruits[.mango] else { return }
        
        strawberryLabel.text = "\(strawberryStock)"
        bananaLabel.text = "\(bananaStock)"
        kiwiLabel.text = "\(kiwiStock)"
        pineappleLabel.text = "\(pineappleStock)"
        mangoLabel.text = "\(mangoStock)"
        
        strawberryStepper.value = Double(strawberryStock)
        bananaStepper.value = Double(bananaStock)
        pineappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
    }
    
    @IBAction private func didTapDismissButton(_ sender: UIButton) {
        self.delegate?.updateStockDelegate(changeStock: fruits)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func didTapFruitStepper(_ sender: UIStepper) {
        guard let (fruit, label) = decideStepper(sender) else { return }
        
        fruits[fruit] = Int(sender.value)
        
        updateLabel(label: label, stepper: sender)
    }
    
    private func decideStepper(_ sender: UIStepper) -> (Fruit, UILabel)? {
        switch sender {
        case strawberryStepper:
            return (.strawberry, strawberryLabel)
        case bananaStepper:
            return (.banana, bananaLabel)
        case pineappleStepper:
            return (.pineapple, pineappleLabel)
        case kiwiStepper:
            return (.kiwi, kiwiLabel)
        case mangoStepper:
            return (.mango, mangoLabel)
        default:
            return nil
        }
    }
    
    private func updateLabel(label: UILabel, stepper: UIStepper) {
        label.text = "\(Int(stepper.value))"
    }
}
