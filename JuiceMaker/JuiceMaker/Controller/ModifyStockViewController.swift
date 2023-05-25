//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by dasan & kyungmin on 2023/05/16.
//

import UIKit

final class ModifyStockViewController: UIViewController {
    private var fruitStocks: [Int] = [Int]()
    private var modifiedStocks: [Int] = [Int]()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockStepper: [UIStepper]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
        initializeStepperValue()
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        if let stepperIndex = fruitStockStepper.firstIndex(of: sender) {
            fruitStockLabels[stepperIndex].text = String(Int(sender.value))
            modifiedStocks[stepperIndex] = Int(sender.value)
        }
    }
    
    private func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(modifiedStocks[fruitStockLabel.tag])
        }
    }
    
    private func initializeStepperValue() {
        for fruitStockStepper in fruitStockStepper {
            fruitStockStepper.minimumValue = Double(fruitStocks[fruitStockStepper.tag])
        }
    }
    
    private func calculateStockDifference() -> [Int] {
        var stockDifference: [Int] = [Int]()
        for (stockIndex, stock) in modifiedStocks.enumerated() {
            stockDifference.append(stock - fruitStocks[stockIndex])
        }
        return stockDifference
    }
}

extension ModifyStockViewController {
    func setStock(stocks: [Int]) {
        fruitStocks = stocks
        modifiedStocks = fruitStocks
    }
    
    func getStock() -> [Int] {
        return calculateStockDifference()
    }
}
