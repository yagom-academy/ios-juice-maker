//
//  ManageViewController.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//

import UIKit

protocol ManageViewControllerDelegate {
    func sendStocks(stocks : [Fruits: Int])
}

class ManageViewController: UIViewController {
    
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
    
    var fruitDictionary: [Fruits: Int] = [:]
    lazy var labelDictionary: [Fruits: UILabel] = [.strawberry: strawberryStockLabel,
                                            .banana: bananaStockLabel,
                                            .pineapple: pineappleStockLabel,
                                            .kiwi: kiwiStockLabel,
                                            .mango: mangoStockLabel]
    lazy var stepperDictionary: [Fruits: UIStepper] = [.strawberry: strawberryStepper,
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
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchStepper(_ sender: UIStepper) {
        let selectedStepperDictionary = stepperDictionary.filter{ $0.value == sender }
        selectedStepperDictionary.forEach{ fruit, stepper in labelDictionary[fruit]?.text = String(Int(sender.value)) }
    }
    
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "경고", message: "재고를 수정하시겠습니까?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: {_ in
            self.changeStocks()
            self.dismiss(animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showStock() {
        fruitDictionary.forEach{ (fruit, stock) in labelDictionary[fruit]?.text = String(stock) }
        fruitDictionary.forEach{ (fruit, stock) in stepperDictionary[fruit]?.value = Double(stock) }
    }
    
    func changeStocks() {
        stepperDictionary.forEach{ fruit, stepper in fruitDictionary[fruit] = Int(stepper.value) }
        delegate?.sendStocks(stocks: fruitDictionary)
    }
}
