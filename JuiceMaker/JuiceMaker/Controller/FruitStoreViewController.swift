//
//  FruitBasketViewController.swift
//  JuiceMaker
//
//  Created by 송종환 on 2023/01/05.
//
import UIKit

final class FruitStoreViewController: UIViewController {
    
    let fruitStore = FruitStore.shared
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStepper()
        setUpLabel()
    }

    func setUpStepper() {
        [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper].forEach {
            $0.wraps = true
            $0.maximumValue = 1000
            $0.minimumValue = 0
        }
    }
    
    func setUpLabel() {
        [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel].forEach {
            $0.sizeToFit()
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
    
        switch sender {
        case strawberryStepper:
            strawberryLabel.text = Int(sender.value).description
            strawberryLabel.sizeToFit()
        case bananaStepper:
            bananaLabel.text = Int(sender.value).description
            bananaLabel.sizeToFit()
        case pineappleStepper:
            pineappleLabel.text = Int(sender.value).description
            pineappleLabel.sizeToFit()
        case kiwiStepper:
            kiwiLabel.text = Int(sender.value).description
            kiwiLabel.sizeToFit()
        case mangoStepper:
            mangoLabel.text = Int(sender.value).description
            mangoLabel.sizeToFit()
        default:
            break
        }
    }
}

