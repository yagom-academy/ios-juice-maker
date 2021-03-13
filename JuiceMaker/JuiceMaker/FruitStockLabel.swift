//
//  UILabelExtension.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/11.
//

import Foundation
import UIKit

class StockLabel: UILabel {
    var fruit: Fruit = FruitType.strawberry
//
//    init(_ fruitType: Fruit) {
//        super.init(frame: .zero)
//        self.fruit = fruitType
//    }
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
    //필요없는 코드가 되어버렸다
    
    func update() {
        self.text = String(fruit.stock)
    }
}
