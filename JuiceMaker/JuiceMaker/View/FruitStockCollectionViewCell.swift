//
//  FruitStockCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import UIKit

class FruitStockCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fruitEmojiLabel: UILabel!
    @IBOutlet weak var fruitStockLabel: UILabel!
    
    func update(emoji: String, stockCount: Int) {
        fruitEmojiLabel.text = emoji
        fruitStockLabel.text = String(stockCount)
    }
}
