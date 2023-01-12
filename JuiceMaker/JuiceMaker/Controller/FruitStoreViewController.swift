//
//  FruitBasketViewController.swift
//  JuiceMaker
//
//  Created by 송종환 on 2023/01/05.
//
import UIKit

final class FruitStoreViewController: UIViewController {
    let fruitStore = FruitStore.shared
        
    var currentFruitBasket: [Fruit: Int] {
        return FruitStore.shared.fruitsBasket
    }
    
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
}
