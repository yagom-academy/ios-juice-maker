//
//  JuiceLabel.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

final class FruitStockLabel: UILabel {
    private var juiceMaker = JuiceMaker.shared
    private(set) var kindFruit: Fruits?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateLabel(_ :)),
                                               name: Notification.Name(rawValue: "changeFruitAmount"),
                                               object: nil)
        self.layer.backgroundColor = .init(gray: 0.8, alpha: 0.6)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.adjustsFontSizeToFitWidth = true
    }
    
    func initValue(fruit: Fruits) {
        guard let amount = juiceMaker.fruitStorage.fruits[fruit] else {
            return
        }
        self.kindFruit = fruit
        self.text = String(amount)
    }
    
    @objc func updateLabel(_ notification: Notification) {
        guard let fruit = kindFruit, let amount = juiceMaker.fruitStorage.fruits[fruit] else {
            return
        }
        self.text = String(amount)
    }
}
