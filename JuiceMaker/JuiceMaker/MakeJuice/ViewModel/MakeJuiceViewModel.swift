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
    
    /// 특정 과일의 현재 재고를 확인
    func stock(of fruit: FruitStore.Fruit) -> Quantity {
        return juiceMaker.stock(of: fruit)
    }
    
    
    /// 특정 과일을 주문
    /// 제조 성공 시 화면에 보여질 재고를 인덱스별로 업데이트 합니다.
    ///
    /// - Parameter _: 주문한 쥬스의 종류
    mutating func order(_ juice: JuiceMaker.Juice) {
        
        do {
            let sortOfFruits = try juiceMaker.order(juice)
            displayingStocks.value = self.stockToUpdate(with: sortOfFruits)
            
        } catch {
            if error as? JuiceManufacturerError == .soldOut {
                print("재고 소진")
            }
        }
    }
    
    /// 화면에 보여지는 과일 배열 중 특정 과일의 인덱스를 반환
    ///
    /// - Returns: `Int?` 특정 과일이 배열 내 존재할 경우 해당 인덱스 반환. 없을 경우 nil
    ///
    /// - Parameter fruit: 과일의 종류
    private func index(of fruit: FruitStore.Fruit) -> Int? {
        return displayingFruits.firstIndex(of: fruit)
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
            guard let fruitIndex = index(of: fruit) else {
                return nil
            }
            return (fruitIndex, stock(of: fruit))
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
