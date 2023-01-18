//
//  JuiceMaker - FruitStoreViewController.swift
//  Created by Andrew, 혜모리 on 2023.01.06
//

import UIKit

final class FruitStoreViewController: UIViewController {
    weak var delegate: StockUpdateableDelegate?
    var currentStockList: [FruitStore.Fruit: Int] = [:]
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!

    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    private lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryLabel,
        .banana: bananaLabel,
        .pineapple: pineappleLabel,
        .kiwi: kiwiLabel,
        .mango: mangoLabel
    ]
    
    private lazy var fruitStockStepper: [FruitStore.Fruit: UIStepper] = [
        .strawberry: strawberryStepper,
        .banana: bananaStepper,
        .pineapple: pineappleStepper,
        .kiwi: kiwiStepper,
        .mango: mangoStepper
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCurrentStock()
        configureFruitStepper()
        configureUI()
    }
    
    private func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(currentStockList[fruit] ?? 0)
        }
    }
    
    private func configureFruitStepper() {
        for (fruit, stepper) in fruitStockStepper {
            stepper.value = Double(currentStockList[fruit] ?? 0)
        }
    }
    
    private func configureUI() {
        let fruitLabelList: [UILabel] = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel,
                                         mangoLabel]
        let cornerRadiusValue: CGFloat = 7
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
        
        for label in fruitLabelList {
            label.layer.cornerRadius = cornerRadiusValue
            label.clipsToBounds = true
        }
    }
    
    @IBAction private func changeStrawberryStock(_ sender: UIStepper) {
        strawberryLabel.text = Int(sender.value).description
    }
    
    @IBAction private func changeBananaStock(_ sender: UIStepper) {
        bananaLabel.text = Int(sender.value).description
    }
    
    @IBAction private func changePineappleStock(_ sender: UIStepper) {
        pineappleLabel.text = Int(sender.value).description
    }
    
    @IBAction private func changeKiwiStock(_ sender: UIStepper) {
        kiwiLabel.text = Int(sender.value).description
    }
    
    @IBAction private func changeMangoStock(_ sender: UIStepper) {
        mangoLabel.text = Int(sender.value).description
    }
    
    private func addStockListByStepper() -> [FruitStore.Fruit: Int] {
        var stockList: [FruitStore.Fruit: Int] = [:]
        
        for (fruit, value) in fruitStockValue {
            guard let quantityAdded = value.text, let stockToBeAdded = Int(quantityAdded) else {
                return addStockListByStepper()
            }
            stockList[fruit] = stockToBeAdded
        }
        return stockList
    }
    
    @IBAction private func didTapDissmisButton(_ sender: UIButton) {
        delegate?.updateStock(to: addStockListByStepper())
        dismiss(animated: true, completion: nil)
    }
}
