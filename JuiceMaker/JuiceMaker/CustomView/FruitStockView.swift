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
    
    // TODO: add error
    var fruitStock: Int? = nil {
        willSet {
            guard let stock = newValue else {
                return
            }
            fruitView.fruitStock.text = String(stock)
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
    
    @IBAction func stepperChanged(sender: UIStepper) {
        fruitStock = Int(sender.value)
    }
}
