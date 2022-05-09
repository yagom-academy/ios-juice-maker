//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var delegate: ManangingOrderDelegate?
    var fruits: [Fruit: Int]?
    var juiceMaker: JuiceMaker? 
    
    var isValid: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruits = delegate?.setUpStock()
        updateStepperDefaultValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        delegate?.updateUI()
    }
    
    @IBAction func stepperButtonDidTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryLabel.text = String(Int(sender.value))
            juiceMaker?.editStock(of: .strawberry, Int(sender.value))
        case bananaStepper:
            bananaLabel.text = String(Int(sender.value))
            juiceMaker?.editStock(of: .banana, Int(sender.value))
        case pineappleStepper:
            pineappleLabel.text = String(Int(sender.value))
            juiceMaker?.editStock(of: .pineapple, Int(sender.value))
        case kiwiStepper:
            kiwiLabel.text = String(Int(sender.value))
            juiceMaker?.editStock(of: .kiwi, Int(sender.value))
        case mangoStepper:
            mangoLabel.text = String(Int(sender.value))
            juiceMaker?.editStock(of: .mango, Int(sender.value))
        default:
            return
        }
    }
}

extension StoreViewController {
    func updateStepperDefaultValue() {
        self.strawberryStepper.value = Double(fruits?[.strawberry] ?? 0)
        self.bananaStepper.value = Double(fruits?[.banana] ?? 0)
        self.pineappleStepper.value = Double(fruits?[.pineapple] ?? 0)
        self.kiwiStepper.value = Double(fruits?[.kiwi] ?? 0)
        self.mangoStepper.value = Double(fruits?[.mango] ?? 0)
    }
    
    func updateUI() {
        self.strawberryLabel.text = String(Int(strawberryStepper.value))
        self.bananaLabel.text = String(Int(bananaStepper.value))
        self.pineappleLabel.text = String(Int(pineappleStepper.value))
        self.kiwiLabel.text = String(Int(kiwiStepper.value))
        self.mangoLabel.text = String(Int(mangoStepper.value))
    }
}
