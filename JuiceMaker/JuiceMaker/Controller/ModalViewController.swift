//
//  ModalViewController.swift
//  JuiceMaker
//
//  Created by jiinheo on 2022/02/17.
//

import UIKit

protocol ModalViewDelegate: AnyObject {
    func finishModal()
}

class ModalViewController: UIViewController {
    weak var delegate: ModalViewDelegate?
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
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshQuantity()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.finishModal()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func refreshQuantity() {
        guard let juiceMaker = juiceMaker else {
            return
        }

        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        strawberryStepper.value = Double(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        bananaStepper.value = Double(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        pineappleStepper.value = Double(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        kiwiStepper.value = Double(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
        mangoStepper.value = Double(juiceMaker.quantity(of: .mango))
    }
    
    @IBAction func tappedStepper(_ sender: UIStepper) {
        guard let juiceMaker = juiceMaker else { return }
        
        let stepperValue = Int(sender.value)
        switch sender {
        case strawberryStepper:
            juiceMaker.updateQuantity(of: .strawberry, quantity: stepperValue)
        case bananaStepper:
            juiceMaker.updateQuantity(of: .banana, quantity: stepperValue)
        case pineappleStepper:
            juiceMaker.updateQuantity(of: .pineapple, quantity: stepperValue)
        case kiwiStepper:
            juiceMaker.updateQuantity(of: .kiwi, quantity: stepperValue)
        case mangoStepper:
            juiceMaker.updateQuantity(of: .mango, quantity: stepperValue)
        default:
            break
        }
        refreshQuantity()
    }
}
