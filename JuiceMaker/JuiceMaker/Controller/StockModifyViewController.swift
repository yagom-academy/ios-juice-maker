//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by si won kim on 2021/11/02.
//

import UIKit

class StockModifyViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initJuiceMakerViewController()
    }
    
    func initJuiceMakerViewController() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel), name: FruitStore.shared.didChangeStock, object: nil)
    }

    @objc
    func changeStockLabel() {
        strawberryStockLabel.text =  FruitStore.shared.showStock(of: .strawberry)
        bananaStockLabel.text =  FruitStore.shared.showStock(of: .banana)
        pineappleStockLabel.text =  FruitStore.shared.showStock(of: .pineapple)
        kiwiStockLabel.text =  FruitStore.shared.showStock(of: .kiwi)
        mangoStockLabel.text =  FruitStore.shared.showStock(of: .mango)
    }
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        FruitStore.shared.add(fruit: .strawberry)
    }
    
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        FruitStore.shared.add(fruit: .banana)
    }
    
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        FruitStore.shared.add(fruit: .pineapple)
    }
    
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        FruitStore.shared.add(fruit: .kiwi)
    }
    
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        FruitStore.shared.add(fruit: .mango)
    }

}
