//
//  MakeJuiceViewModel.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/17.
//

import Foundation

struct MakeJuiceViewModel {
    private var displayingFruits: [FruitStore.Fruit]
    private var juiceMaker: JuiceMaker
    var displayingStocks: JMObservable<[(Int, Quantity)]>
    
    init(
        displayingFruits: [FruitStore.Fruit] = defaultFruits,
        juiceMaker: JuiceMaker,
        stocksByIndex: [(Int, Quantity)] = []
    ) {
        self.displayingFruits = displayingFruits
        self.juiceMaker = juiceMaker
        self.displayingStocks = JMObservable(stocksByIndex)
        
        if stocksByIndex.isEmpty {
            self.displayingStocks.value = stockToUpdate(with: displayingFruits)
        }
    }
    
    /// 특정 과일을 주문
    /// 제조 성공 시 화면에 보여질 재고를 인덱스별로 업데이트 합니다.
    ///
    /// - Parameter _: 주문한 쥬스의 종류
    mutating func order(_ juice: JuiceMaker.Juice) throws {
        let sortOfFruits = try juiceMaker.order(juice)
        let stocks = self.stockToUpdate(with: sortOfFruits)
        displayingStocks.value = stocks
    }
    
    /// 특정 과일들의 현재 재고를 인덱스별로 반환
    ///
    /// - Returns: `[(Int, Quantity)]` 업데이트 할 과일들의 인덱스별 재고 튜플 반환
    ///
    /// - Parameter fruits: 재고를 업데이트 해야할 과일의 배열
    private func stockToUpdate(
        with fruits: [FruitStore.Fruit]
    ) -> [(Int, Quantity)] {
        return fruits.compactMap({ fruit -> (Int, Quantity)? in
            guard let fruitIndex = displayingFruits.firstIndex(of: fruit) else {
                return nil
            }
            return (fruitIndex, juiceMaker.stock(of: fruit))
        })
    }
}

extension MakeJuiceViewModel {
    private static let defaultFruits: [FruitStore.Fruit] = [
        .strawberry,
        .banana,
        .pineapple,
        .kiwi,
        .mango
    ]
}
