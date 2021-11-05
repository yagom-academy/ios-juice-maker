//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by si won kim on 2021/11/02.
//

import UIKit

class StockModifyViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStockModifyViewController()
    }
    
    private func initStockModifyViewController() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel), name: FruitStore.shared.didChangeStock, object: nil)
        
        changeStockLabel()
        initializeStepper()
    }

    @objc
    private func changeStockLabel() {
        strawberryStockLabel.text =  FruitStore.shared.showStock(of: .strawberry)
        bananaStockLabel.text =  FruitStore.shared.showStock(of: .banana)
        pineappleStockLabel.text =  FruitStore.shared.showStock(of: .pineapple)
        kiwiStockLabel.text =  FruitStore.shared.showStock(of: .kiwi)
        mangoStockLabel.text =  FruitStore.shared.showStock(of: .mango)
    }
    
    private func initializeStepper() {
        strawberryStepper.restorationIdentifier = "딸기"
        bananaStepper.restorationIdentifier = "바나나"
        pineappleStepper.restorationIdentifier = "파인애플"
        kiwiStepper.restorationIdentifier = "키위"
        mangoStepper.restorationIdentifier = "망고"
        
        strawberryStepper.value = Double(FruitStore.shared.showStock(of: .strawberry)) ?? 0.0
        bananaStepper.value = Double(FruitStore.shared.showStock(of: .banana)) ?? 0.0
        pineappleStepper.value = Double(FruitStore.shared.showStock(of: .pineapple)) ?? 0.0
        kiwiStepper.value = Double(FruitStore.shared.showStock(of: .kiwi)) ?? 0.0
        mangoStepper.value = Double(FruitStore.shared.showStock(of: .mango)) ?? 0.0
    }
    
    @IBAction private func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        guard let stepperIdentifier = sender.restorationIdentifier,
              let fruit = Fruit(rawValue: stepperIdentifier) else {
                  return
              }
        let quantity = Int(sender.value)
        FruitStore.shared.updateStock(fruit: fruit, quantity: quantity)
    }
}
