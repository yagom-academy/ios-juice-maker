//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/15.
//

import UIKit

final class StockManagementViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    @IBOutlet var stockManagementStepperCollection: [CustomStepper]!
    
    private var fruitStore: FruitStore = FruitStore.shared
    var configurationDelegate: Configurable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStockLabel()
        configureStockManagementStepper()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeStockList()
        configurationDelegate?.assignLabelText()
    }
    
    @IBAction func goBackPreviousView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func touchUpStockStepper(_ sender: CustomStepper) {
        guard let fruit = sender.customIdentifier else { return }
        
        let currentStepperValue: String = Int(sender.value).description
        let selectedFruitStockLabel = selectFruitStockLabel(with: fruit)
        selectedFruitStockLabel.text = currentStepperValue
    }
    
    private func selectFruitStockLabel(with fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLabel
        case .banana:
            return bananaStockLabel
        case .pineapple:
            return pineappleStockLabel
        case .kiwi:
            return kiwiStockLabel
        case .mango:
            return mangoStockLabel
        }
    }
    
    private func changeStockList() {
        var currentStockList: [Fruit: Int] = [:]
        let fruitStockLabelCollection: [UILabel] = [strawberryStockLabel,
                                                    bananaStockLabel,
                                                    pineappleStockLabel,
                                                    kiwiStockLabel,
                                                    mangoStockLabel]
        
        for (fruit, stockLabel) in zip(Fruit.allCases, fruitStockLabelCollection) {
            currentStockList[fruit] = Int(stockLabel.text ?? "0")
        }
        
        fruitStore.setStockList(with: currentStockList)
    }
    
    private func configureStockLabel() {
        let stockList = fruitStore.getRemainStock()
        let fruitStockLabelCollection: [UILabel] = [strawberryStockLabel,
                                                    bananaStockLabel,
                                                    pineappleStockLabel,
                                                    kiwiStockLabel,
                                                    mangoStockLabel]
        
        for index in fruitStockLabelCollection.indices {
            fruitStockLabelCollection[index].text = stockList[index]
        }
    }
    
    private func configureStockManagementStepper() {
        let stockList = fruitStore.getRemainStock()
        
        for index in stockManagementStepperCollection.indices {
            guard let currentStock = Double(stockList[index]) else { return }
            
            stockManagementStepperCollection[index].value = currentStock
            stockManagementStepperCollection[index].customIdentifier = Fruit.allCases[index]
        }
    }
}
