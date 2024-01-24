//
//  JuiceMakerView.swift
//  JuiceMaker
//
//  Created by Jaehun Lee on 1/23/24.
//

import UIKit

protocol JuiceMakerViewDelegate {
    func juiceMakerViewStockEditButtonTouchedUp(_ view: JuiceMakerView)
    func juiceMakerViewJuiceOrderButtonTouchedUp(_ view: JuiceMakerView, juice: Juice)
}

class JuiceMakerView: UIView {
    var delegate: JuiceMakerViewDelegate!
    @IBOutlet var strawberryQuantity: UILabel!
    @IBOutlet var bananaQuantity: UILabel!
    @IBOutlet var pineappleQuantity: UILabel!
    @IBOutlet var kiwiQuantity: UILabel!
    @IBOutlet var mangoQuantity: UILabel!
    
    func showFruitStock(_ fruitBox: [Fruit:Int]) {
        if let quantity = fruitBox[.strawberry] {
            strawberryQuantity.text = String(quantity)
        }
        if let quantity = fruitBox[.banana] {
            bananaQuantity.text = String(quantity)
        }
        if let quantity = fruitBox[.pineapple] {
            pineappleQuantity.text = String(quantity)
        }
        if let quantity = fruitBox[.kiwi] {
            kiwiQuantity.text = String(quantity)
        }
        if let quantity = fruitBox[.mango] {
            mangoQuantity.text = String(quantity)
        }
    }
    
    @IBAction func touchUpStockEditButton(_ sender: UIBarButtonItem) {
        delegate.juiceMakerViewStockEditButtonTouchedUp(self)
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.strawberryBanana)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.mangoKiwi)
    }
    
    @IBAction func touchUpStrawberryJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.strawberry)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.banana)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.pineapple)
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.kiwi)
    }
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: UIButton) {
        delegate.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.mango)
    }
}
