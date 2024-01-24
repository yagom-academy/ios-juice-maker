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
