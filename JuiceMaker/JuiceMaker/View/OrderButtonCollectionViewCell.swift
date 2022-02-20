//
//  OrderButtonCollectionViewCell.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import UIKit

class OrderButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var juiceLabel: UILabel!
    
    func update(name: String) {
        juiceLabel.text = name
    }
}
