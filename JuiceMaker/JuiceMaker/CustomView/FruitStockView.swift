//
//  FruitStockView.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/20.
//

import Foundation
import UIKit

class FruitStockView : UIView {
    
    @IBOutlet weak var FruitView : UIView!
    @IBOutlet weak var stockStepper: UIStepper!
    
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
}
