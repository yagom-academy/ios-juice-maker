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
    
    var fruitStock: Int? = nil {
        willSet {
            do {
                try updateStockLabel(newValue)
            } catch {
                debugPrint("Error: System in FruitStockView")
            }
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
    
    private func updateStockLabel(_ stock: Int?) throws {
        guard let newStock = stock else {
            throw JuiceMakerError.system
        }
        fruitView.fruitStock.text = String(newStock)
    }
    
    @IBAction func stepperChanged(sender: UIStepper) {
        fruitStock = Int(sender.value)
    }
}
