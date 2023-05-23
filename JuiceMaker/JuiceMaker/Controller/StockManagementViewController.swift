//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/15.
//

import UIKit

final class StockManagementViewController: UIViewController {
    private var stockList: [String] = []
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
    
    func setStockList(with stockList: [String]) {
        self.stockList = stockList
    }
    
    private func configureStockLabel() {
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
        for index in stockManagementStepperCollection.indices {
            guard let currentStock = Double(stockList[index]) else { return }
            
            stockManagementStepperCollection[index].value = currentStock
            stockManagementStepperCollection[index].customIdentifier = Fruit.allCases[index]
        }
    }
}
