//
//  stockViewController.swift
//  JuiceMaker
//
//  Created by 오경식 on 2022/05/02.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        strawberryStock.text = FruitStore.shared.showFruitsStock(name: .strawberry)
        bananaStock.text = FruitStore.shared.showFruitsStock(name: .banana)
        pineappleStock.text = FruitStore.shared.showFruitsStock(name: .pineapple)
        kiwiStock.text = FruitStore.shared.showFruitsStock(name: .kiwi)
        mangoStock.text = FruitStore.shared.showFruitsStock(name: .mango)
    }
    
    @IBAction func didTapClosedStockViewController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
