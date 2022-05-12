//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import UIKit

final class StoreViewController: UIViewController {
    @IBOutlet private weak var strawberryLabel: UILabel?
    @IBOutlet private weak var bananaLabel: UILabel?
    @IBOutlet private weak var pineappleLabel: UILabel?
    @IBOutlet private weak var kiwiLabel: UILabel?
    @IBOutlet private weak var mangoLabel: UILabel?
    
    @IBOutlet private weak var strawberryStepper: UIStepper?
    @IBOutlet private weak var bananaStepper: UIStepper?
    @IBOutlet private weak var pineappleStepper: UIStepper?
    @IBOutlet private weak var kiwiStepper: UIStepper?
    @IBOutlet private weak var mangoStepper: UIStepper?
    
    var fruits: FruitStock = [:]
    
    var manager: StoreViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateStepperDefaultValue(with: fruits)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUI()
    }
}

private extension StoreViewController {
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        manager?.didCanceled(viewcontroller: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperButtonDidTapped(_ stepper: UIStepper) {
        switch stepper {
        case (let strawberry) where strawberry == strawberryStepper:
            self.strawberryLabel?.text = strawberry.descriptionValue()
            self.manager?.stepperValueDidChanged(viewcontroller: self, fruit: .strawberry, with: strawberry.intValue())
        case (let banana) where banana == bananaStepper:
            self.bananaLabel?.text = self.bananaStepper?.descriptionValue()
            self.manager?.stepperValueDidChanged(viewcontroller: self, fruit: .banana, with: banana.intValue())
        case (let pineapple) where pineapple == pineappleStepper:
            self.pineappleLabel?.text = pineapple.descriptionValue()
            self.manager?.stepperValueDidChanged(viewcontroller: self, fruit: .pineapple, with: pineapple.intValue())
        case (let kiwi) where kiwi == kiwiStepper:
            self.kiwiLabel?.text = kiwi.descriptionValue()
            self.manager?.stepperValueDidChanged(viewcontroller: self, fruit: .kiwi, with: kiwi.intValue())
        case (let mango) where mango == mangoStepper:
            self.mangoLabel?.text = mango.descriptionValue()
            self.manager?.stepperValueDidChanged(viewcontroller: self, fruit: .mango, with: mango.intValue())
        default:
            return
        }
    }
}

private extension StoreViewController {
    func updateStepperDefaultValue(with fruits: FruitStock) {
        self.strawberryStepper?.value = Double(fruits[.strawberry] ?? 0)
        self.bananaStepper?.value = Double(fruits[.banana] ?? 0)
        self.pineappleStepper?.value = Double(fruits[.pineapple] ?? 0)
        self.kiwiStepper?.value = Double(fruits[.kiwi] ?? 0)
        self.mangoStepper?.value = Double(fruits[.mango] ?? 0)
    }
    
    func updateUI() {
        self.strawberryLabel?.text = self.strawberryStepper?.descriptionValue()
        self.bananaLabel?.text = self.bananaStepper?.descriptionValue()
        self.pineappleLabel?.text = self.pineappleStepper?.descriptionValue()
        self.kiwiLabel?.text = self.kiwiStepper?.descriptionValue()
        self.mangoLabel?.text = self.mangoStepper?.descriptionValue()
    }
}

private extension UIStepper {
    func descriptionValue() -> String {
        return intValue().description
    }
}
