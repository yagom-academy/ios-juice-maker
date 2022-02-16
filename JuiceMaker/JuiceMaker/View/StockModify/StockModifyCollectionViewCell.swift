//
//  StockModifyCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import UIKit

class StockModifyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    
    var stepperHandler: (() -> Void)?
    
    var value: Int {
        Int(countStepper.value)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        stepperHandler?()
    }
    
    func update(emoji: String, count: Int, handler: @escaping () -> Void) {
        stockLabel.text = emoji
        countLabel.text = String(count)
        countStepper.value = Double(count)
        self.stepperHandler = handler
    }
}
