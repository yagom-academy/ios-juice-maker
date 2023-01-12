//  JuiceMaker - FruitStockViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.06


import UIKit

final class FruitStockViewController: UIViewController {
    
    static let identifier = "FruitStockViewController"

    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabel(juice: fruitStore.getFruits())
        updateStepper()
    }
    
    private func updateLabel(juice: [Fruit: Int]) {
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
    
    private func updateStepper() {
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
    
    @IBAction private func didTapFruitStepper(_ sender: UIStepper) {
        guard let fruit = decideStepper(sender) else {
            return
        }
        
        guard let currentStock = fruitStore.getFruits()[fruit] else {
            return
        }
        
        if Int(sender.value) > currentStock {
            fruitStore.increaseFruit(fruit)
        } else {
            fruitStore.decreaseFruit(fruit)
        }
        
        updateLabel(juice: fruitStore.getFruits())
    }
    
    private func decideStepper(_ sender: UIStepper) -> Fruit? {
        switch sender {
        case strawberryStepper:
            return .strawberry
        case bananaStepper:
            return .banana
        case pineappleStepper:
            return .pineapple
        case kiwiStepper:
            return .kiwi
        case mangoStepper:
            return .mango
        default:
            return nil
        }
    }
    
    @IBAction private func didTapDismissButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
