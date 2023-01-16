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
    
    var fruitStore: FruitStore = FruitStore()
    var getFruits: [Fruit: Int] {
        return fruitStore.fruits
    }
    weak var delegate: UpdatableFruitStock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setDefaultLabel(juice: getFruits)
        setDefaultStepperValue()
    }
    
    func setFruits(_ fruits: FruitStore) {
        self.fruitStore = fruits
    }
    

    private func setDefaultLabel(juice: [Fruit: Int]) {

        guard let strawberry = juice[.strawberry],
              let banana = juice[.banana],
              let kiwi = juice[.kiwi],
              let pineapple = juice[.pineapple],
              let mango = juice[.mango] else { return }
        
        strawberryLabel.text = "\(strawberry)"
        bananaLabel.text = "\(banana)"
        kiwiLabel.text = "\(kiwi)"
        pineappleLabel.text = "\(pineapple)"
        mangoLabel.text = "\(mango)"
    }
    
    private func setDefaultStepperValue() {
        guard let strawberryStock = getFruits[.strawberry],
        let bananaStock = getFruits[.banana],
        let pineappleStock = getFruits[.pineapple],
        let kiwiStock = getFruits[.kiwi],
        let mangoStock = getFruits[.mango] else { return }
        
        strawberryStepper.value = Double(strawberryStock)
        bananaStepper.value = Double(bananaStock)
        pineappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
    }
    
    @IBAction private func didTapDismissButton(_ sender: UIButton) {
        self.delegate?.updateStock(changeStock: self.fruitStore)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func didTapFruitStepper(_ sender: UIStepper) {
        guard let (fruit, label) = decideStepper(sender),
              let currentStock = getFruits[fruit] else {
            return
        }
        
        if Int(sender.value) > currentStock {
            fruitStore.increaseFruit(fruit)
        } else if Int(sender.value) < currentStock {
            fruitStore.decreaseFruit(fruit)
        }
        
        updateLabel(fruit: fruit, label: label)
    }
    
    private func decideStepper(_ sender: UIStepper) -> (Fruit, UILabel)? {
        switch sender {
        case strawberryStepper:
            return (.strawberry, strawberryLabel)
        case bananaStepper:
            return (.banana, bananaLabel)
        case pineappleStepper:
            return (.pineapple, pineappleLabel)
        case kiwiStepper:
            return (.kiwi, kiwiLabel)
        case mangoStepper:
            return (.mango, mangoLabel)
        default:
            return nil
        }
    }
    
    private func updateLabel(fruit: Fruit, label: UILabel) {
        guard let changedStock = getFruits[fruit] else { return }
        
        label.text = "\(changedStock)"
    }
}
