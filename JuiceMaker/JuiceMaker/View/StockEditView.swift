//
//  StockEditView.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

protocol StockEditViewDelegate: AnyObject {
    func exitStockEditView()
}

final class StockEditView: UIView {
    weak var delegate: StockEditViewDelegate?
    
    @IBOutlet weak var strawberryQuantity: UILabel!
    @IBOutlet weak var bananaQuantity: UILabel!
    @IBOutlet weak var pineappleQuantity: UILabel!
    @IBOutlet weak var kiwiQuantity: UILabel!
    @IBOutlet weak var mangoQuantity: UILabel!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.exitStockEditView()
    }
    
    func updateFruitQuantityLabel(fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            switch fruit {
            case .strawberry:
                strawberryQuantity.text = String(quantity)
            case .banana:
                bananaQuantity.text = String(quantity)
            case .pineapple:
                pineappleQuantity.text = String(quantity)
            case .kiwi:
                kiwiQuantity.text = String(quantity)
            case .mango:
                mangoQuantity.text = String(quantity)
            }
        }
    }
}
