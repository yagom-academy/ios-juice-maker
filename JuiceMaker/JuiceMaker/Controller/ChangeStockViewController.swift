//  JuiceMaker - ChangeStockViewController.swift
//  Created by 송준, Rowan on 2023/01/05.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ChangeStockViewController: UIViewController {
    
    private var fruitsStock: [Fruits: Int] {
        return FruitStore.shared.fruitsStock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStock()
        initializeSteppers()
    }
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineapple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet var steppers: [UIStepper]!
    
    func initializeSteppers() {
        for stepper in steppers {
            if let selectedFruit = identifyRelatedFruit(of: stepper),
               let initialValue = fruitsStock[selectedFruit] {
                stepper.maximumValue = 100
                stepper.minimumValue = 0
                stepper.stepValue = 1
                stepper.value = Double(initialValue)
            }
        }
    }
    
    func identifyRelatedFruit(of stepper: UIStepper) -> Fruits? {
        switch stepper {
        case strawberryStepper: return .strawberry
        case bananaStepper: return .banana
        case pineappleStepper: return .pineapple
        case kiwiStepper: return .kiwi
        case mangoStepper: return .mango
        default: return nil
        }
    }
    
    func displayStock() {
        if let strawberryStock = fruitsStock[.strawberry],
           let bananaStock = fruitsStock[.banana],
           let pineappleStock = fruitsStock[.pineapple],
           let kiwiStock = fruitsStock[.kiwi],
           let mangoStock = fruitsStock[.mango] {
            stockOfStrawberry.text = String(strawberryStock)
            stockOfBanana.text = String(bananaStock)
            stockOfPineapple.text = String(pineappleStock)
            stockOfKiwi.text = String(kiwiStock)
            stockOfMango.text = String(mangoStock)
        }
    }
    
    @IBAction func pushCloseButton() {
        self.dismiss(animated: true)
    }
    
    func identifyRelatedLabel(of stepper: UIStepper) -> UILabel? {
        switch stepper {
        case strawberryStepper: return stockOfStrawberry
        case bananaStepper: return stockOfBanana
        case pineappleStepper: return stockOfPineapple
        case kiwiStepper: return stockOfKiwi
        case mangoStepper: return stockOfMango
        default: return nil
        }
    }
    
    @IBAction func pushStepper(_ sender: UIStepper) {
        guard let fruitsLabel = identifyRelatedLabel(of: sender) else { return }
        fruitsLabel.text = Int(sender.value).description
    }
}
