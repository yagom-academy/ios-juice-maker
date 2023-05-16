//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by hemg on 2023/05/15.
//

import UIKit

protocol FruitStockDelegate: AnyObject {
    func addStock(_ value: [Fruit: Int])
}

class ChangeStockViewController: UIViewController {
    private var fruitStore: FruitStore = FruitStore.shard
    
    private var fruitStock: [Fruit: Int] = [:]
    
    weak var delegate: FruitStockDelegate?
    
    @IBOutlet weak var changeConfirmBarButton: UIBarButtonItem!
    @IBOutlet weak var strawBerryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawBerryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockOnLabel()
        changeFruitStockStepper()
    }
    
    private func showFruitStockOnLabel() {
        fruitStock = fruitStore.receiveFruitStock()
        
        let fruitAndLabel: [Fruit : UILabel] = [
            .strawBerry: strawBerryLabel,
            .banana: bananaLabel,
            .pineApple: pineappleLabel,
            .kiwi: kiwiLabel,
            .mango: mangoLabel
        ]
        
        for (fruit, label) in fruitAndLabel {
            guard let stock = self.fruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    private func changeFruitStockStepper() {
        fruitStock = fruitStore.receiveFruitStock()
        let fruitAndStepper: [Fruit : UIStepper] = [
            .strawBerry: strawBerryStepper,
            .banana: bananaStepper,
            .pineApple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        
        for (fruit, stepper) in fruitAndStepper {
            guard let stock = fruitStock[fruit] else { return }
            stepper.value = Double(stock)
        }
    }
    
    @IBAction func changeConfirm(_ sender: Any) {
        
        let fruitLabels: [Fruit: UILabel] = [
            .strawBerry: strawBerryLabel,
            .banana: bananaLabel,
            .pineApple: pineappleLabel,
            .kiwi: kiwiLabel,
            .mango: mangoLabel
        ]
        
        for (fruit, label) in fruitLabels {
            guard let stock = self.fruitStock[fruit] else { return }
            guard let text = label.text, let intText = Int(text) else { return }
            
            fruitStore.changeStock(with: [fruit: -intText - -stock])
        }
        
        self.delegate?.addStock(self.fruitStock)
        self.dismiss(animated: true)
    }
    
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
        let stepperAndLabel: [UIStepper: UILabel] = [
            strawBerryStepper: strawBerryLabel,
            bananaStepper: bananaLabel,
            pineappleStepper: pineappleLabel,
            kiwiStepper: kiwiLabel,
            mangoStepper: mangoLabel
        ]
        
        if let label = stepperAndLabel[sender] {
            label.text = Int(sender.value).description
        }
    }
}

