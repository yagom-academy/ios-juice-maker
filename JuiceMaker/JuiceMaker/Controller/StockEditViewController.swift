//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by jin on 9/6/22.
//

import UIKit

class StockEditViewController: UIViewController {
    
    private var fruitStore: FruitStore
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
    
    init?(fruitStore: FruitStore, coder: NSCoder) {
        self.fruitStore = fruitStore
        super.init(coder: coder)
    }

    @available(*, unavailable, renamed: "init(fruitStore:coder:)")
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStockLabelAndStepperValue()
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }

    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepperPressed(_ sender: UIStepper) {
        fruitStore.updateFruitStock(fruit: .strawberry, amountOf: Int(sender.value))
        strawberryStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func bananaStepperPressed(_ sender: UIStepper) {
        fruitStore.updateFruitStock(fruit: .banana, amountOf: Int(sender.value))
        bananaStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func pineappleStepperPressed(_ sender: UIStepper) {
        fruitStore.updateFruitStock(fruit: .pineapple, amountOf: Int(sender.value))
        pineappleStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func kiwiStepperPressed(_ sender: UIStepper) {
        fruitStore.updateFruitStock(fruit: .kiwi, amountOf: Int(sender.value))
        kiwiStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func mangoStepperPressed(_ sender: UIStepper) {
        fruitStore.updateFruitStock(fruit: .mango, amountOf: Int(sender.value))
        mangoStockLabel.text = Int(sender.value).description
    }
    
    private func setStockLabelAndStepperValue() {
        Fruit.allCases.forEach({ fruit in
            guard let fruitStock = try? fruitStore.fetchStock(of: fruit) else { return }
            switch fruit {
            case .strawberry:
                strawberryStepper.value = Double(fruitStock)
                strawberryStockLabel.text = String(fruitStock)
            case .banana:
                bananaStepper.value = Double(fruitStock)
                bananaStockLabel.text = String(fruitStock)
            case .pineapple:
                pineappleStepper.value = Double(fruitStock)
                pineappleStockLabel.text = String(fruitStock)
            case .kiwi:
                kiwiStepper.value = Double(fruitStock)
                kiwiStockLabel.text = String(fruitStock)
            case .mango:
                mangoStepper.value = Double(fruitStock)
                mangoStockLabel.text = String(fruitStock)
            }
        })
    }
    
    func setFruitStore(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
}
