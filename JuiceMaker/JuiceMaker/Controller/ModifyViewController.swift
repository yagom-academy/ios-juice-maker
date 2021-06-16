//
//  ModifyViewController.swift
//  JuiceMaker
//
//  Created by Yongwoo Marco on 2021/06/08.
//

import UIKit

class ModifyViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    var fruitStore = FruitStore.shared
    var observation = [NSKeyValueObservation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        observation = [
            fruitStore.observe(\.strawberry, options: [.new]) { _, _ in self.updateUILabel(.strawberry) },
            fruitStore.observe(\.banana, options: [.new]) { _, _ in self.updateUILabel(.banana) },
            fruitStore.observe(\.mango, options: [.new]) { _, _ in self.updateUILabel(.mango) },
            fruitStore.observe(\.kiwi, options: [.new]) { _, _ in self.updateUILabel(.kiwi) },
            fruitStore.observe(\.pineapple, options: [.new]) { _, _ in self.updateUILabel(.pineapple) }
        ]
        strawberryStepper.value = Double(fruitStore[.strawberry])
        bananaStepper.value = Double(fruitStore[.banana])
        mangoStepper.value = Double(fruitStore[.mango])
        kiwiStepper.value = Double(fruitStore[.kiwi])
        pineappleStepper.value = Double(fruitStore[.pineapple])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for fruit in Fruit.allCases {
            updateUILabel(fruit)
        }
    }
    
    @IBAction func changeValueAction(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper: fruitStore[.strawberry] = UInt(sender.value)
        case bananaStepper:     fruitStore[.banana] = UInt(sender.value)
        case mangoStepper:      fruitStore[.mango] = UInt(sender.value)
        case kiwiStepper:       fruitStore[.kiwi] = UInt(sender.value)
        case pineappleStepper:  fruitStore[.pineapple] = UInt(sender.value)
        default:                print("stepperAction 에러")
        }
    }
    @IBAction func closeModifyView(_ sender: Any) {
        dismiss(animated: false)
    }

    func updateUILabel(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:   strawberryLabel.text = String(fruitStore[.strawberry])
        case .banana:       bananaLabel.text = String(fruitStore[.banana])
        case .pineapple:    pineappleLabel.text = String(fruitStore[.pineapple])
        case .kiwi:         kiwiLabel.text = String(fruitStore[.kiwi])
        case .mango:        mangoLabel.text = String(fruitStore[.mango])
        }
    }
}
