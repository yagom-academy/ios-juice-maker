//  JuiceMaker - FruitStockViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.06


import UIKit

class FruitStockViewController: UIViewController {

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
    
    
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(juice: fruitStore.getFruits())
    }
    
    func updateLabel(juice: [Fruit: Int]) {
        guard let strawberry = juice[.strawberry],
              let banana = juice[.banana],
              let kiwi = juice[.kiwi],
              let pineapple = juice[.pineapple],
              let mango = juice[.mango] else { return }
        
        strawberryLabel.text = String(strawberry)
        bananaLabel.text = String(banana)
        kiwiLabel.text = String(kiwi)
        pineappleLabel.text = String(pineapple)
        mangoLabel.text = String(mango)
    }
    
    func updateStepper() {
        guard let strawberryStock = fruitStore.getFruits()[.strawberry],
        let bananaStock = fruitStore.getFruits()[.banana],
        let pineappleStock = fruitStore.getFruits()[.pineapple],
        let kiwiStock = fruitStore.getFruits()[.kiwi],
        let mangoStock = fruitStore.getFruits()[.mango] else { return }
        
        strawberryStepper.value = Double(strawberryStock)
        bananaStepper.value = Double(bananaStock)
        pineappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        let fruit = decideStpeer(sender)
    }
    
    func decideStpeer(_ sender: UIStepper) -> Fruit {
        switch sender {
        case strawberryStepper:
            return Fruit.strawberry
        case bananaStepper:
        }
    }
}
