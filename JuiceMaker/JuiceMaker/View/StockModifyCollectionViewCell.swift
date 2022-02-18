//
//  StockModifyCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import UIKit

class StockModifyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var stockCountLabel: UILabel!
    @IBOutlet weak var stockCountStepper: UIStepper!
    
    var stepperHandler: (() -> Void)?
    
    var fruitCount: Int {
        Int(stockCountStepper.value)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        stepperHandler?()
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
}
