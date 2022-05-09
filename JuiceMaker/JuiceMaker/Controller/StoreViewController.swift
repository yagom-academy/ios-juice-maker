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
    
    var isValid: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruits = delegate?.setUpStock()
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
            setMinimumValue(sender, fruit: .strawberry)
            strawberryLabel.text = String(change(for: .strawberry, number: Int(sender.value)) ?? 0)
        case bananaStepper:
            setMinimumValue(sender, fruit: .banana)
            bananaLabel.text = String(change(for: .banana, number: Int(sender.value)) ?? 0)
        case pineappleStepper:
            setMinimumValue(sender, fruit: .pineapple)
            pineappleLabel.text = String(change(for: .pineapple, number: Int(sender.value)) ?? 0)
        case kiwiStepper:
            setMinimumValue(sender, fruit: .kiwi)
            kiwiLabel.text = String(change(for: .kiwi, number: Int(sender.value)) ?? 0)
        case mangoStepper:
            setMinimumValue(sender, fruit: .mango)
            mangoLabel.text = String(change(for: .mango, number: Int(sender.value)) ?? 0)
        default:
            return
        }
    }
    
    func change(for fruit: Fruit, number: Int) -> Int? {
        var previousValue = 0
        if(previousValue < number) {
            previousValue = number
            fruits?[fruit]! += 1
        } else if (previousValue > number){
            previousValue = number
            fruits?[fruit]! -= 1
        }
        return fruits?[fruit]
    }
    
    func setMinimumValue(_ sender: UIStepper, fruit: Fruit) {
        if (isValid == false) {
            sender.minimumValue = Double(((fruits?[fruit])!) * (-1))
            isValid = true
        }
    }
}

extension StoreViewController {
    func updateUI() {
        self.strawberryLabel.text = fruits?[.strawberry]?.description
        self.bananaLabel.text = fruits?[.banana]?.description
        self.pineappleLabel.text = fruits?[.pineapple]?.description
        self.kiwiLabel.text = fruits?[.kiwi]?.description
        self.mangoLabel.text = fruits?[.mango]?.description
    }
}
