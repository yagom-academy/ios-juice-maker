//
//  JuiceManufacturer.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/17.
//

import Foundation

/// 과일 쥬스를 만들던 도중 발생할 수 있는 에러
enum JuiceManufacturerError: Error {
    case soldOut
    case notExistRecipe
}

/// 필요한 과일의 재고를 확인하여 주스를  만드는 역할을 수행
struct JuiceManufacturer {
    private var fruitStore: FruitStore
    private let recipe: JuiceMaker.Recipe
    
    init(
        _ fruitStore: FruitStore = FruitStore(),
        _ recipe: JuiceMaker.Recipe = JuiceMaker.Recipe()
    ) {
        self.fruitStore = fruitStore
        self.recipe = recipe
    }
    
    /// 쥬스 만들기.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: 주스를 만들고 나서의 재고. 성공했을 경우
    ///
    /// - Parameter of: 만들 쥬스
    ///
    /// - Throws: `JuiceMakerError`타입의 에러. 쥬스 만들기에 실패 했을 경우
    mutating func make(of juice: JuiceMaker.Juice) throws -> FruitStore {
        guard let neededFruits = recipe.recipe(of: juice) else {
            throw JuiceManufacturerError.notExistRecipe
        }
        try validateStock(of: neededFruits)
        try useStock(of: neededFruits)
        return fruitStore
    }
    
    /// 쥬스를 만들 때 필요한 과일의 재고가 충분히 존재하는지 확인.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: Nothing. 재고가 충분히 존재 할 경우
    ///
    /// - Parameter of: 필요한 과일과 갯수
    ///
    /// - Throws: `JuiceMakerError.soldOutError` 쥬스 만들 때 필요한 과일의 재고가 모자랄 경우
    private func validateStock(of neededFruits: [JuiceMaker.Recipe.NeededFruit]) throws {
        let outOfStocks = neededFruits.filter { neededFruit in
            let stock = fruitStore.stock(of: neededFruit.fruit)
            return stock < neededFruit.quantity
        }
        if outOfStocks.count > 0 {
            throw JuiceManufacturerError.soldOut
        }
    }
    
    /// 쥬스를 만들기 위해 과일 저장소에서 필요한 과일들의 재고 갯수를 감소시킴.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: Nothing.
    ///
    /// - Parameter of: 필요한 과일과 갯수
    mutating private func useStock(of neededFruits: [JuiceMaker.Recipe.NeededFruit]) throws {
        try neededFruits.forEach { neededFruits in
            try fruitStore.decreaseStock(of: neededFruits.fruit, neededFruits.quantity)
        }
    }
}
