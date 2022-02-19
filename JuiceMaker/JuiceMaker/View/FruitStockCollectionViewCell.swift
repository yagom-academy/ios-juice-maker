//
//  FruitStockCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import UIKit

class FruitStockCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var fruitImageView: UIImageView!
    @IBOutlet private weak var fruitStockLabel: UILabel!
    
    func update(fruitImageAssetName: String, count: Int) {
        fruitImageView.image = UIImage(named: fruitImageAssetName)
        fruitStockLabel.text = String(count)
    }
}
