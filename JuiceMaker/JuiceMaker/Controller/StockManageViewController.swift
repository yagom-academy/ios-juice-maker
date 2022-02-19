//
//  StockManageViewController.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import UIKit

class StockManageViewController: UIViewController {
    var fruitStore: FruitStore?
    
    @IBOutlet private weak var strawberryStock: UILabel!
    @IBOutlet private weak var bananaStock: UILabel!
    @IBOutlet private weak var kiwiStock: UILabel!
    @IBOutlet private weak var pineappleStock: UILabel!
    @IBOutlet private weak var mangoStock: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    @IBAction private func updateStock(_ sender: UIStepper) {
        var fruit = Fruit.strawberry
        
        switch sender.tag {
        case 0:
            fruit = .strawberry
        case 1:
            fruit = .banana
        case 2:
            fruit = .pineapple
        case 3:
            fruit = .kiwi
        case 4:
            fruit = .mango
        default:
            break
        }
        
        let amount = Int(sender.value)
        let updateInformation = FruitAmountInformation(fruit: fruit, amount: amount)
        fruitStore?.updateFruit([updateInformation])
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    private func configureUI() {
        strawberryStock.text = "\(fruitStore?.store[.strawberry] ?? 0)"
        bananaStock.text = "\(fruitStore?.store[.banana] ?? 0)"
        pineappleStock.text = "\(fruitStore?.store[.pineapple] ?? 0)"
        kiwiStock.text = "\(fruitStore?.store[.kiwi] ?? 0)"
        mangoStock.text = "\(fruitStore?.store[.mango] ?? 0)"
        strawberryStepper.value = Double(fruitStore?.store[.strawberry] ?? 0)
        bananaStepper.value = Double(fruitStore?.store[.banana] ?? 0)
        pineappleStepper.value = Double(fruitStore?.store[.pineapple] ?? 0)
        kiwiStepper.value = Double(fruitStore?.store[.kiwi] ?? 0)
        mangoStepper.value = Double(fruitStore?.store[.mango] ?? 0)
    }

    private func configureNavigationBar() {
        self.title = "재고 추가"
        let navigationItem = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(tapCloseButton))
        self.navigationItem.rightBarButtonItem  = navigationItem
    }
    
    @objc private func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
