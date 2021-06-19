//
//  ModifiyViewController.swift
//  JuiceMaker
//
//  Created by Yosikim, Marco on 2021/06/14.
//

import UIKit

class ModifiyViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    let fruitStore = FruitStore.shared
    var observer = [NSKeyValueObservation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observer = [
            fruitStore.observe(\.strawberry, options: [.new]) { _, _ in
                self.updateUILabel(.strawberry)
            },
            fruitStore.observe(\.banana, options: [.new]) { _, _ in
                self.updateUILabel(.banana)
            },
            fruitStore.observe(\.pineapple, options: [.new]) { _, _ in
                self.updateUILabel(.pineapple)
            },
            fruitStore.observe(\.kiwi, options: [.new]) { _, _ in
                self.updateUILabel(.kiwi)
            },
            fruitStore.observe(\.mango, options: [.new]) { _, _ in
                self.updateUILabel(.mango)
            }
        ]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for fruit in Fruit.allCases {
            updateUILabel(fruit)
        }
        strawberryStepper.value = Double(fruitStore.currentStock(.strawberry))
        bananaStepper.value = Double(fruitStore.currentStock(.banana))
        mangoStepper.value = Double(fruitStore.currentStock(.mango))
        kiwiStepper.value = Double(fruitStore.currentStock(.kiwi))
        pineappleStepper.value = Double(fruitStore.currentStock(.pineapple))
    }
    
    @IBAction func strawberryValueChanged(_ sender: UIStepper) {
        fruitStore[.strawberry] = Int(sender.value)
    }
    @IBAction func bananaValueChanged(_ sender: UIStepper) {
        fruitStore[.banana] = Int(sender.value)
    }
    @IBAction func mangoValueChanged(_ sender: UIStepper) {
        fruitStore[.mango] = Int(sender.value)
    }
    @IBAction func kiwiValueChanged(_ sender: UIStepper) {
        fruitStore[.kiwi] = Int(sender.value)
    }
    @IBAction func pineappleValueChanged(_ sender: UIStepper) {
        fruitStore[.pineapple] = Int(sender.value)
    }
    @IBAction func closeModifyView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ModifiyViewController {
    func updateUILabel(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(fruitStore.currentStock(fruit))
        case .banana:
            bananaLabel.text = String(fruitStore.currentStock(fruit))
        case .pineapple:
            pineappleLabel.text = String(fruitStore.currentStock(fruit))
        case .kiwi:
            kiwiLabel.text = String(fruitStore.currentStock(fruit))
        case .mango:
            mangoLabel.text = String(fruitStore.currentStock(fruit))
        }
    }
}
