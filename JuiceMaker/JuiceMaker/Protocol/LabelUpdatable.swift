//
//  Updatable.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/18.
//

import UIKit

protocol LabelUpdatable {
    func getLabel(on fruit: Fruit) -> UILabel
}

extension LabelUpdatable {
    func updateLabelsText(of fruitStore: FruitStore) {
        do {
            let fruitList = Fruit.makeFruitList()
            for fruit in fruitList {
                let fruitStock = try fruitStore.getStocks(of: fruit)
                let uiLabel = getLabel(on: fruit)
                uiLabel.text = "\(fruitStock)"
            }
        } catch {
            fatalError("유효하지 않은 접근입니다.")
        }
    }
}
