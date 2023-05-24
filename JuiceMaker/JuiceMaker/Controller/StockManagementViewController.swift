//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/15.
//

import UIKit

final class StockManagementViewController: UIViewController {
    private var fruitStore: FruitStore = FruitStore.shared
    var configurationDelegate: Configurable?
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    @IBOutlet var stockManagementStepperCollection: [CustomStepper]!
    
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

        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = Int(sender.value).description
        case .banana:
            bananaStockLabel.text = Int(sender.value).description
        case .pineapple:
            pineappleStockLabel.text = Int(sender.value).description
        case .kiwi:
            kiwiStockLabel.text = Int(sender.value).description
        case .mango:
            mangoStockLabel.text = Int(sender.value).description
        }
    }
    
    private func changeStockList() {
        var currentStockList: [Fruit: Int] = [:]
        let fruitStockLabelCollection: [UILabel] = [strawberryStockLabel,
                                                    bananaStockLabel,
                                                    pineappleStockLabel,
                                                    kiwiStockLabel,
                                                    mangoStockLabel]
        
        for (fruit, label) in zip(Fruit.allCases, fruitStockLabelCollection) {
            currentStockList[fruit] = Int(label.text ?? "0")
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
