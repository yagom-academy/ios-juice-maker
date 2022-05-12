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
    
    var makerViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "재고 추가"
        guard let juiceMakerController = self.makerViewController as? MakerViewController else { return }
        
        stockStrawberryCount.text = juiceMakerController.retrieveFruitCount(fruitName: .strawberry)
        stockBananaCount.text = juiceMakerController.retrieveFruitCount(fruitName: .banana)
        stockPineappleCount.text = juiceMakerController.retrieveFruitCount(fruitName: .pineapple)
        stockKiwiCount.text = juiceMakerController.retrieveFruitCount(fruitName: .kiwi)
        stockMangoCount.text = juiceMakerController.retrieveFruitCount(fruitName: .mango)
        
        stockStrawberryStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .strawberry))
        stockBananaStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .banana))
        stockPineappleStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .pineapple))
        stockKiwiStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .kiwi))
        stockMangoStepper.value = retrieveFruitValue(fruit: juiceMakerController.retrieveFruitCount(fruitName: .mango))

        establishStepperEnvironment()
    }
    
    func retrieveFruitValue(fruit: String) -> Double {
        if let fruitAmount = Double(fruit) {
            return fruitAmount
        } else {
            return StockCount.empty.amountInDecimalPointType
        }
    }
    
    func establishStepperEnvironment() {
        stockStrawberryStepper.maximumValue = StockCount.maxFruit.amountInDecimalPointType
        stockBananaStepper.maximumValue = StockCount.maxFruit.amountInDecimalPointType
        stockPineappleStepper.maximumValue = StockCount.maxFruit.amountInDecimalPointType
        stockKiwiStepper.maximumValue = StockCount.maxFruit.amountInDecimalPointType
        stockMangoStepper.maximumValue = StockCount.maxFruit.amountInDecimalPointType
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        let newStock: Dictionary<FruitKind, Int> = [.strawberry: Int(stockStrawberryStepper.value),
                                                    .banana: Int(stockBananaStepper.value),
                                                    .pineapple: Int(stockPineappleStepper.value),
                                                    .kiwi: Int(stockKiwiStepper.value),
                                                    .mango: Int(stockMangoStepper.value)]
        guard let juiceMakerController = self.makerViewController as? MakerViewController else { return }
        juiceMakerController.receiveEditedFruitCount(receivedStock: newStock)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperStrawberryValueChanged(_ sender: UIStepper) {
        stockStrawberryCount.text = Int(sender.value).description
    }
    @IBAction func stepperBananaValueChanged(_ sender: UIStepper) {
        stockBananaCount.text = Int(sender.value).description
    }
    @IBAction func stepperPineappleValueChanged(_ sender: UIStepper) {
        stockPineappleCount.text = Int(sender.value).description
    }
    @IBAction func stepperKiwiValueChanged(_ sender: UIStepper) {
        stockKiwiCount.text = Int(sender.value).description
    }
    @IBAction func stepperMangoValueChanged(_ sender: UIStepper) {
        stockMangoCount.text = Int(sender.value).description
    }
}


