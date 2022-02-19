//
//  StockModifyCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import UIKit

class StockModifyCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var fruitImageView: UIImageView!
    @IBOutlet private weak var stockCountLabel: UILabel!
    @IBOutlet private weak var stockCountStepper: UIStepper!
    
    var stepperHandler: (() -> Void)?
    
    var fruitCount: Int {
        Int(stockCountStepper.value)
    }
    
    func update(count: Int) {
        stockCountLabel.text = String(count)
    }
    
    func update(fruitImageAssetName: String, count: Int, handler: @escaping () -> Void) {
        fruitImageView.image = UIImage(named: fruitImageAssetName)
        stockCountLabel.text = String(count)
        stockCountStepper.value = Double(count)
        self.stepperHandler = handler
    }
    
    @IBAction private func stepperValueChanged(_ sender: Any) {
        stepperHandler?()
    }
}
