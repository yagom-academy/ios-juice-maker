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
    func make(_ juice: Juice) -> Result<Juice, JuiceMakerError>
    func count(of fruit: Fruit) -> Int
    func setFruitAmount(for fruit: Fruit, to amount: Int)
}

/// 쥬스 매이커를 위한 기능 
struct JuiceMaker: JuiceMakerType {
    private let fruitStore : FruitStoreType
    
    /// 쥬스를 만들기 위해 과일 클래스를 상속
    init(fruitStore: FruitStoreType = FruitStore()) {
        self.fruitStore = fruitStore
    }

    /// 과일쥬스를 만들기 위한 함수
    /// - juice : 쥬스 이름
    func make(_ juice: Juice) -> Result<Juice, JuiceMakerError> {
        guard fruitStore.hasIngredients(for: juice) else {
            return .failure(.notEnoughIngredients)
        }
        fruitStore.consume(ingredients: juice.ingredients)
        return .success(juice)
    }

    /// 쥬스를 만든 후 소진된 과일의 수량 파악을 위한 함수
    /// - fruit : 과일 이름
    func count(of fruit: Fruit) -> Int {
        return fruitStore.count(of: fruit)
    }

    func setFruitAmount(for fruit: Fruit, to amount: Int) {
        fruitStore.setAmount(for: fruit, to: amount)
    }
}
