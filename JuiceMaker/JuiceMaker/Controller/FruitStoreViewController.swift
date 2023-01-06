//
//  FruitBasketViewController.swift
//  JuiceMaker
//
//  Created by 송종환 on 2023/01/05.
//
import UIKit

final class FruitStoreViewController: UIViewController {
    
    let fruitStore = FruitStore.shared
    lazy var currentFruitBasket = fruitStore.shareFruitBasket()
    
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
        setUpLabel()
        setUpStepper()
    }

    
    func setUpStepper() {
        if let strawBerryValue = currentFruitBasket[.strawberry],
        let bananaValue = currentFruitBasket[.banana],
        let pineappleValue = currentFruitBasket[.pineapple],
        let kiwiValue = currentFruitBasket[.kiwi],
        let mangoValue = currentFruitBasket[.mango] {
            strawberryStepper.value = Double(strawBerryValue)
            bananaStepper.value = Double(bananaValue)
            pineappleStepper.value = Double(pineappleValue)
            kiwiStepper.value = Double(kiwiValue)
            mangoStepper.value = Double(mangoValue)
        }
        [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper].forEach {
                $0.maximumValue = 1000
                $0.minimumValue = 0
            }
        }

    func setUpLabel() {
        strawberryLabel.text = currentFruitBasket[.strawberry]?.description
        bananaLabel.text = currentFruitBasket[.banana]?.description
        pineappleLabel.text = currentFruitBasket[.pineapple]?.description
        kiwiLabel.text = currentFruitBasket[.kiwi]?.description
        mangoLabel.text = currentFruitBasket[.mango]?.description
        [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel].forEach {
            $0.sizeToFit()
        }
    }
    
    func fruitLabel(_ fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryLabel
        case .banana:
            return bananaLabel
        case .pineapple:
            return pineappleLabel
        case .kiwi:
            return kiwiLabel
        case .mango:
            return mangoLabel
        }
    }
    
    func stepperTarget(_ stepper: UIStepper)  -> Fruit? {
        switch stepper {
        case strawberryStepper:
            return Fruit.strawberry
        case bananaStepper:
            return Fruit.banana
        case pineappleStepper:
            return Fruit.pineapple
        case kiwiStepper:
            return Fruit.kiwi
        case mangoStepper:
            return Fruit.mango
        default:
            return nil
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        guard let targetFruit = stepperTarget(sender) else {
            return
        }
        
        guard let fruitCount = currentFruitBasket[targetFruit] else {
            return
        }
        
        if Int(sender.value) > fruitCount {
            fruitStore.addOne(of: targetFruit)
            currentFruitBasket[targetFruit]! += 1
        } else {
            fruitStore.reduceOne(of: targetFruit)
            currentFruitBasket[targetFruit]! -= 1
        }
        
        let fruitLabel = fruitLabel(targetFruit)
        fruitLabel.text = currentFruitBasket[targetFruit]?.description
        fruitLabel.sizeToFit()
    }
}


