//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum JuiceMakerError: Error {
    case notEnoughIngredients
}

/// 쥬스 메이커 타입
protocol JuiceMakerType {

    /// 과일쥬스를 만듭니다.
    /// - Parameters :
    ///   - juice : 쥬스 이름
    /// - Returns : 쥬스 제조 결과
    func make(juice: Juice) -> Result<Juice, JuiceMakerError>

    /// 지정한 과일의 재고를 반환합니다.
    ///
    /// - Parameters :
    ///   - fruit : 과일 이름
    ///
    /// - Returns : 과일 재고
    func count(of fruit: Fruit) -> Int

    
    func setFruitAmount(for fruit: Fruit, to amount: Int)
}

struct JuiceMaker: JuiceMakerType {
    private let fruitStore : FruitStoreType

    init(fruitStore: FruitStoreType = FruitStore()) {
        self.fruitStore = fruitStore
    }


    func make(juice: Juice) -> Result<Juice, JuiceMakerError> {
        guard fruitStore.hasIngredients(for: juice) else {
            return .failure(.notEnoughIngredients)
        }
        fruitStore.consume(ingredients: juice.ingredients)
        return .success(juice)
    }


    func count(of fruit: Fruit) -> Int {
        return fruitStore.count(of: fruit)
    }

    func setFruitAmount(for fruit: Fruit, to amount: Int) {
        fruitStore.setAmount(for: fruit, to: amount)
    }
}
