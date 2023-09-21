//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Kiseok, 쥬봉이 on 2023/09/15.
//

import UIKit

final class StockChangeViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private let fruitStore: FruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeStepperValue()
        setupUI()
    }
    
    private func initializeStepperValue() {
        strawberryStepper.value = Double(fruitStore.fruits[.strawberry] ?? .zero)
        bananaStepper.value = Double(fruitStore.fruits[.banana] ?? .zero)
        pineappleStepper.value = Double(fruitStore.fruits[.pineapple] ?? .zero)
        kiwiStepper.value = Double(fruitStore.fruits[.kiwi] ?? .zero)
        mangoStepper.value = Double(fruitStore.fruits[.mango] ?? .zero)
    }
    
    private func setupUI() {
        strawberryStockLabel.text = Int(strawberryStepper.value).description
        bananaStockLabel.text = Int(bananaStepper.value).description
        pineappleStockLabel.text = Int(pineappleStepper.value).description
        kiwiStockLabel.text = Int(kiwiStepper.value).description
        mangoStockLabel.text = Int(mangoStepper.value).description
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        setupUI()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        changeStock()
        self.presentingViewController?.dismiss(animated: true)
    }
    
    private func changeStock() {
        var fruitChange: [Fruit: Int] = [:]
        
        fruitChange[.strawberry] = Int(strawberryStepper.value)
        fruitChange[.banana] = Int(bananaStepper.value)
        fruitChange[.pineapple] = Int(pineappleStepper.value)
        fruitChange[.kiwi] = Int(kiwiStepper.value)
        fruitChange[.mango] = Int(mangoStepper.value)
        
        fruitStore.changeStock(by: fruitChange)
    }
}
