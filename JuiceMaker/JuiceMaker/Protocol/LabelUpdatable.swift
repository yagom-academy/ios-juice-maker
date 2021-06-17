//
//  Updatable.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/18.
//

import UIKit

protocol LabelUpdatable {
    var labelList: [Fruit: UILabel] { get set }
}

extension LabelUpdatable {
    func updateLabelsText(of fruitStore: FruitStore) {
        do {
            let fruitList = Fruit.makeFruitList()
            for fruit in fruitList {
                let fruitStock = try fruitStore.getStocks(of: fruit)
                if let uiLabel = labelList[fruit] {
                    uiLabel.text = "\(fruitStock)"
                }
            }
        } catch {
            fatalError("유효하지 않은 접근입니다.")
        }
    }
}
