//
//  FruitStockView.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/20.
//

import Foundation
import UIKit

class FruitStockView : UIView {
    
    @IBOutlet weak var fruitView : FruitView!
    @IBOutlet weak var stockStepper: UIStepper!
    
    private(set) var fruitStock: Int? = nil {
        willSet {
            updateStockLabel(newValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let view = Bundle.main.loadNibNamed("FruitStockView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func setStock(_ stock: Int) {
        self.fruitStock = stock
        stockStepper.value = Double(stock)
        stockStepper.minimumValue = Double(stock)
    }
    
    private func updateStockLabel(_ stock: Int?) {
        guard let newStock = stock else {
            debugPrint("Error: System in FruitStockView (stock is nil)")
            return
        }
        fruitView.fruitStock.text = String(newStock)
    }
    
    @IBAction func stepperChanged(sender: UIStepper) {
        fruitStock = Int(sender.value)
    }
}
