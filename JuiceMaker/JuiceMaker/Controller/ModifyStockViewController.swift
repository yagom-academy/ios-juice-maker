//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by dasan & kyungmin on 2023/05/16.
//

import UIKit

final class ModifyStockViewController: UIViewController {
    private var fruitStocks: [Int] = [Int]()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockSteppers: [UIStepper]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
        initializeStepperValue()
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        if let stepperIndex = fruitStockSteppers.firstIndex(of: sender) {
            fruitStockLabels[stepperIndex].text = String(Int(sender.value))
            fruitStocks[stepperIndex] = Int(sender.value)
        }
    }
    
    private func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStocks[fruitStockLabel.tag])
        }
    }
    
    private func initializeStepperValue() {
        for fruitStockStepper in fruitStockSteppers {
            fruitStockStepper.minimumValue = Double(fruitStocks[fruitStockStepper.tag])
        }
    }
}

extension ModifyStockViewController {
    func setStock(_ stocks: [Int]) {
        fruitStocks = stocks
    }
    
    func getStock() -> [Int] {
        return fruitStocks
    }
}
