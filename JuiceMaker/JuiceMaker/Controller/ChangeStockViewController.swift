//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/15.
//

import UIKit

final class ChangeStockViewController: UIViewController {
    
    @IBOutlet weak var strawBerryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    @IBOutlet weak var strawBerryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockOnLabel()
    }
    
    private func showFruitStockOnLabel() {
        let fruitStock = FruitStore.shared.currentFruitStock
           
           let fruitAndLabel: [Fruit : UILabel] = [
               .strawBerry: strawBerryStockLabel,
               .banana: bananaStockLabel,
               .pineApple: pineappleStockLabel,
               .kiwi: kiwiStockLabel,
               .mango: mangoStockLabel
           ]
           
           for (fruit, label) in fruitAndLabel {
               guard let stock = fruitStock[fruit] else { return }
               label.text = String(stock)
           }
       }
    
    
    @IBAction func changeConfirm(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

