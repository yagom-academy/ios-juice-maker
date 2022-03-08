//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

protocol Updateable: AnyObject {
    func update(for stock: [Fruit: Int])
}

class ManagingStockViewController: UIViewController {
    var stock: [Fruit: Int]?
    weak var delegate: Updateable?
    
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
    
    @IBAction func matchLabel(with stepper: UIStepper) {
        switch stepper {
        case strawberryStepper:
            strawberryLabel.text = String(format: "%.0f", strawberryStepper.value)
            stock?[.strawberry] = Int(strawberryStepper.value)
        case bananaStepper:
            bananaLabel.text = String(format: "%.0f", bananaStepper.value)
            stock?[.banana] = Int(bananaStepper.value)
        case pineappleStepper:
            pineappleLabel.text = String(format: "%.0f", pineappleStepper.value)
            stock?[.pineapple] = Int(pineappleStepper.value)
        case kiwiStepper:
            kiwiLabel.text = String(format: "%.0f", kiwiStepper.value)
            stock?[.kiwi] = Int(kiwiStepper.value)
        case mangoStepper:
            mangoLabel.text = String(format: "%.0f", mangoStepper.value)
            stock?[.mango] = Int(mangoStepper.value)
        default:
            return
        }
    }
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func initializeViewValue() {
        guard let stock = stock else { return }
        for (fruit, amount) in stock {
            setUpViewValue(fruit, amount)
        }
    }
    
    private func setUpViewValue(_ fruit: Fruit, _ amount: Int) {
        switch fruit {
        case.strawberry:
            strawberryLabel.text = String(amount)
            strawberryStepper.value = Double(amount)
        case.banana:
            bananaLabel.text = String(amount)
            bananaStepper.value = Double(amount)
        case.pineapple:
            pineappleLabel.text = String(amount)
            pineappleStepper.value = Double(amount)
        case.kiwi:
            kiwiLabel.text = String(amount)
            kiwiStepper.value = Double(amount)
        case.mango:
            mangoLabel.text = String(amount)
            mangoStepper.value = Double(amount)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewValue()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let stock = stock else { return }
        delegate?.update(for: stock)
    }
}
