//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

/// 쥬스 만들기 실패
enum JuiceMakerError: Error {
    case notEnoughIngredients
}

/// 쥬스 메이커 타입
protocol JuiceMakeable {
    
    /// 과일쥬스를 만듭니다.
    ///
    /// - Parameters:
    ///     - juice : 쥬스 이름
    ///
    ///  - Returns: juice의 성공, 실패를 반환
    func make(juice: Juice) -> Result<Juice, JuiceMakerError>
    
    /// 지정한 과일의 재고를 반환합니다.
    ///
    /// - Parameters:
    ///     - fruit : 과일 이름
    ///
    ///  - Returns:fruit의 재고를 반환
    func count(of fruit: Fruit) -> Int
    
    /// 지정한 과일의 재고를 해당 개수로 설정합니다.
    ///
    /// - Parameters:
    ///     - fruit : 과일 이름
    ///     - amount : 과일 수량
    func setAmount(for fruit: Fruit, to amount: Int)
}

struct JuiceMaker: JuiceMakeable {
    private let fruitStore : FruitStorable
    
    init(fruitStore: FruitStorable = FruitStore()) {
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
    
    func setAmount(for fruit: Fruit, to amount: Int) {
        fruitStore.setAmount(for: fruit, to: amount)
    }
}
