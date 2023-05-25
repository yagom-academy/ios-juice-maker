//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by dasan & kyungmin on 2023/05/16.
//

import UIKit

final class ModifyStockViewController: UIViewController {
    private var oldFruitStocks: [Int] = [Int]()
    private var newFruitStocks: [Int] = [Int]()
    
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
            newFruitStocks[stepperIndex] = Int(sender.value)
        }
    }
    
    private func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(newFruitStocks[fruitStockLabel.tag])
        }
    }
    
    private func initializeStepperValue() {
        for fruitStockStepper in fruitStockStepper {
            fruitStockStepper.minimumValue = Double(oldFruitStocks[fruitStockStepper.tag])
        }
    }
    
    private func calculateStockDifference() -> [Int] {
        var stockDifference: [Int] = [Int]()
        for (stockIndex, stock) in newFruitStocks.enumerated() {
            stockDifference.append(stock - oldFruitStocks[stockIndex])
        }
        return stockDifference
    }
}

extension ModifyStockViewController {
    func setStock(stocks: [Int]) {
        oldFruitStocks = stocks
        newFruitStocks = oldFruitStocks
    }
    
    func getStock() -> [Int] {
        return calculateStockDifference()
    }
}
