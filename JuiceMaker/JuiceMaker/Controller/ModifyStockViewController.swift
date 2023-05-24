//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

protocol Stock {
    func setStock(stocks: [Int])
    func getStock() -> [Int]
}

class ModifyStockViewController: UIViewController {
    var fruitStocks: [Int] = [Int]()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockStepper: [UIStepper]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
        initializeStepperValue()
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        if let stepperIndex = fruitStockStepper.firstIndex(of: sender){
            fruitStockLabels[stepperIndex].text = String(Int(sender.value))
            fruitStocks[stepperIndex] = Int(sender.value)
        }
    }
    
    func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStocks[fruitStockLabel.tag])
        }
    }
    
    func initializeStepperValue() {
        for fruitStockStepper in fruitStockStepper {
            fruitStockStepper.value = Double(fruitStocks[fruitStockStepper.tag])
            fruitStockStepper.minimumValue = Double(fruitStocks[fruitStockStepper.tag])
        }
    }
}

extension ModifyStockViewController: Stock {
    func setStock(stocks: [Int]) {
        fruitStocks = stocks
    }
    
    func getStock() -> [Int] {
        return fruitStocks
    }
}
