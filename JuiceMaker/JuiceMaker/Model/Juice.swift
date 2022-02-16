//
//  Juice.swift
//  JuiceMaker
//
//  Created by Derrick, Ryan-Son on 2022/02/16.
//

/// 쥬스 종류
enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

extension Juice {
    var ingredients: Fruits {
        return IngredientsDirector.ingredients(for: self)
    }
}

/// 소진 될 재료를 생성하는 타입
final class IngredientsBuilder {
    private var ingredients: Fruits = [:]
    
    /// 생성한 재료를 반환합니다.
    func build() -> Fruits {
        return ingredients
    }
    
    /// 소진될 재료의 이름, 개수를 추가 합니다.
    func with(ingredient: Fruit, amount: Int) -> IngredientsBuilder {
        ingredients.updateValue(amount, forKey: ingredient)
        return self
    }
}

/// 지정된 쥬스를 만들기 위해 소진 될 재료를 생성하는 타입
final class IngredientsDirector {
    /// 지정된 쥬스를 만들기 위해 소진 될 재료를 생성한다.
    static func ingredients(for juice: Juice) -> Fruits {
        var builder = IngredientsBuilder()
        
        switch juice {
        case .strawberry:
            builder = builder.with(ingredient: .strawberry, amount: 16)
        case .banana:
            builder = builder.with(ingredient: .banana, amount: 2)
        case .kiwi:
            builder = builder.with(ingredient: .kiwi, amount: 3)
        case .pineapple:
            builder = builder.with(ingredient: .pineapple, amount: 2)
        case .strawberryBanana:
            builder = builder
                .with(ingredient: .strawberry, amount: 10)
                .with(ingredient: .banana, amount: 1)
        case .mango:
            builder = builder.with(ingredient: .mango, amount: 3)
        case .mangoKiwi:
            builder = builder
                .with(ingredient: .mango, amount: 2)
                .with(ingredient: .kiwi, amount: 1)
        }
        
        return builder.build()
    }
}
