//
//  FruitStockCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import UIKit

class FruitStockCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var fruitStockLabel: UILabel!
    
    func update(fruitImageName name: String, stockCount: Int) {
        fruitImageView.image = UIImage(named: name)
        fruitStockLabel.text = String(stockCount)
    }
}
