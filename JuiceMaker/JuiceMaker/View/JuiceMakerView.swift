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
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    func updateSingleFruitQuantityLabel(fruit: Fruit, quantity: Int) {
        switch fruit {
        case .strawberry:
            strawberryQuantityLabel.text = String(quantity)
        case .banana:
            bananaQuantityLabel.text = String(quantity)
        case .pineapple:
            pineappleQuantityLabel.text = String(quantity)
        case .kiwi:
            kiwiQuantityLabel.text = String(quantity)
        case .mango:
            mangoQuantityLabel.text = String(quantity)
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
