//
//  JuiceMakerView.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

protocol JuiceMakerViewDelegate: AnyObject {
    func presentStockEditView()
    func touchUpJuiceOrderButton(_ view: JuiceMakerView, juice: Juice)
}

final class JuiceMakerView: UIView {
    weak var delegate: JuiceMakerViewDelegate?
    
    @IBOutlet weak var strawberryQuantity: UILabel!
    @IBOutlet weak var bananaQuantity: UILabel!
    @IBOutlet weak var pineappleQuantity: UILabel!
    @IBOutlet weak var kiwiQuantity: UILabel!
    @IBOutlet weak var mangoQuantity: UILabel!
    
    func updateSingleFruitQuantityLabel(fruit: Fruit, quantity: Int) {
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
    
    @IBAction func touchUpStockEditButton(_ sender: UIBarButtonItem) {
        delegate?.presentStockEditView()
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .strawberryBanana)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .mangoKiwi)
    }
    
    @IBAction func touchUpStrawberryJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .strawberry)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .banana)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .pineapple)
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .kiwi)
    }
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: UIButton) {
        delegate?.touchUpJuiceOrderButton(self, juice: .mango)
    }
}
