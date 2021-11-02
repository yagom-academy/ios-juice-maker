//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/25.
//

import UIKit

class ModifyStockViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
        
    @IBAction func touchUpCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var modifiedStock: [FruitStore.Fruit:Int]?
    
    private func updateAllStockLabels() {
        let stockLabels: [UILabel]! = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        
        stockLabels.forEach { stockLabel in
            updateStockLabel(with: stockLabel)
        }
    }
    
    private func updateStockLabel(with label: UILabel) {
        guard let fruit = matchFruit(with: label) else {
            return
        }
        
        guard let currentStockCount = modifiedStock?[fruit] else {
            return
        }
        
        label.text = String(currentStockCount)
    }
    
    private func matchFruit(with label: UILabel) -> FruitStore.Fruit? {
        switch label {
        case strawberryStockLabel:
            return .strawberry
        case bananaStockLabel:
            return .banana
        case pineappleStockLabel:
            return .pineapple
        case kiwiStockLabel:
            return .kiwi
        case mangoStockLabel:
            return .mango
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllStockLabels()
    }
}
