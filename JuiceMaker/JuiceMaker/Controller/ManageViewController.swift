//
//  ManageViewController.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//

import UIKit

protocol ManageViewControllerDelegate {
    func sendStocks(stocks: [Fruits: Int])
}

final class ManageViewController: UIViewController {
    
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
    
    var fruitsStockDictionary: [Fruits: Int] = [:]
    private lazy var labelDictionary: [Fruits: UILabel] = [.strawberry: strawberryStockLabel,
                                            .banana: bananaStockLabel,
                                            .pineapple: pineappleStockLabel,
                                            .kiwi: kiwiStockLabel,
                                            .mango: mangoStockLabel]
    
    private lazy var stepperDictionary: [Fruits: UIStepper] = [.strawberry: strawberryStepper,
                                                .banana: bananaStepper,
                                                .pineapple: pineappleStepper,
                                                .kiwi: kiwiStepper,
                                                .mango: mangoStepper]
    
    var delegate: ManageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }
    
    @IBAction func touchCloseButton(_ sender: UIBarButtonItem) {
        changeStocks()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchStepper(_ sender: UIStepper) {
        let selectedStepperDictionary = stepperDictionary.filter{ $0.value == sender }
        selectedStepperDictionary.forEach{ fruit, stepper in labelDictionary[fruit]?.text = String(Int(sender.value)) }
    }
    
    private func showStock() {
        fruitsStockDictionary.forEach{ (fruit, stock) in
            labelDictionary[fruit]?.text = String(stock)
            stepperDictionary[fruit]?.value = Double(stock)
        }
    }
    
    private func changeStocks() {
        stepperDictionary.forEach{ fruit, stepper in fruitsStockDictionary[fruit] = Int(stepper.value) }
        delegate?.sendStocks(stocks: fruitsStockDictionary)
    }
}
