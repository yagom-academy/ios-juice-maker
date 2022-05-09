//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stockStrawberryCount: UILabel!
    @IBOutlet weak var stockBananaCount: UILabel!
    @IBOutlet weak var stockPineappleCount: UILabel!
    @IBOutlet weak var stockKiwiCount: UILabel!
    @IBOutlet weak var stockMangoCount: UILabel!
    
    @IBOutlet weak var stockStrawberryStepper: UIStepper!
    @IBOutlet weak var stockBananaStepper: UIStepper!
    @IBOutlet weak var stockPineappleStepper: UIStepper!
    @IBOutlet weak var stockKiwiStepper: UIStepper!
    @IBOutlet weak var stockMangoStepper: UIStepper!
    
    var MakerController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "재고 추가"
        guard let juiceMakerController = self.MakerController as? MakerViewController else { return }
        
        self.stockStrawberryCount.text = juiceMakerController.retrieveFruitCount(fruitName: .strawberry)
        self.stockBananaCount.text = juiceMakerController.retrieveFruitCount(fruitName: .banana)
        self.stockPineappleCount.text = juiceMakerController.retrieveFruitCount(fruitName: .pineapple)
        self.stockKiwiCount.text = juiceMakerController.retrieveFruitCount(fruitName: .kiwi)
        self.stockMangoCount.text = juiceMakerController.retrieveFruitCount(fruitName: .mango)
        
        stockStrawberryStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .strawberry))
        stockBananaStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .banana))
        stockPineappleStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .pineapple))
        stockKiwiStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .kiwi))
        stockMangoStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .mango))

        establishStepperEnvironment()
    }
    
    func retrieveFruitValue(fruit: String) -> Double {
        guard let fruitAmount = Double(fruit) else { return StockCount.empty.amountInDecimalPoint }
        return fruitAmount
    }
    
    func establishStepperEnvironment() {
        stockStrawberryStepper.maximumValue = StockCount.maxFruit.amountInDecimalPoint
        stockBananaStepper.maximumValue = StockCount.maxFruit.amountInDecimalPoint
        stockPineappleStepper.maximumValue = StockCount.maxFruit.amountInDecimalPoint
        stockKiwiStepper.maximumValue = StockCount.maxFruit.amountInDecimalPoint
        stockMangoStepper.maximumValue = StockCount.maxFruit.amountInDecimalPoint
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        let newStock: Dictionary<FruitKind, Int> = [.strawberry: Int(stockStrawberryStepper.value),
                                                    .banana: Int(stockBananaStepper.value),
                                                    .pineapple: Int(stockPineappleStepper.value),
                                                    .kiwi: Int(stockKiwiStepper.value),
                                                    .mango: Int(stockMangoStepper.value)]
        guard let juiceMakerController = self.MakerController as? MakerViewController else { return }
        juiceMakerController.receiveEditedFruitCount(receivedStock: newStock)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperStrawberryValueChanged(_ sender: UIStepper) {
        self.stockStrawberryCount.text = Int(sender.value).description
    }
    @IBAction func stepperBananaValueChanged(_ sender: UIStepper) {
        self.stockBananaCount.text = Int(sender.value).description
    }
    @IBAction func stepperPineappleValueChanged(_ sender: UIStepper) {
        self.stockPineappleCount.text = Int(sender.value).description
    }
    @IBAction func stepperKiwiValueChanged(_ sender: UIStepper) {
        self.stockKiwiCount.text = Int(sender.value).description
    }
    @IBAction func stepperMangoValueChanged(_ sender: UIStepper) {
        self.stockMangoCount.text = Int(sender.value).description
    }
}


