//
//  Juice.swift
//  JuiceMaker
//
//  Created by Derrick, Ryan-Son on 2022/02/16.
//

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi

    var ingredients: Fruits {
        return IngredientsDirector.make(juice: self)
    }
}

/// [빌더 패턴]
/// 어떤 재료를 소진하는가를 위한 클래스
final class IngredientsBuilder {
    private var ingredients: Fruits = [:]

    /// 소진될 재료가 선택 될 시 완료를 위한 함수
    func build() -> Fruits {
        return ingredients
    }
    
    /// 소진될 재료의 이름, 개수를 추가 하기 위한 함수
    func add(ingredients: Fruits) {
        self.ingredients = ingredients
    }
}

/// [빌더 패턴]
final class IngredientsDirector {
    /// 쥬스가 만들어 질 경우 소진되는 재료들을 빌드 하는 함수
    static func make(juice: Juice) -> Fruits {
        let builder = IngredientsBuilder()

        switch juice {
        case .strawberry:
            builder.add(ingredients: [.strawberry: 16])
        case .banana:
            builder.add(ingredients: [.banana: 2])
        case .kiwi:
            builder.add(ingredients: [.kiwi: 3])
        case .pineapple:
            builder.add(ingredients: [.pineapple: 2])
        case .strawberryBanana:
            builder.add(ingredients: [.strawberry: 10, .banana: 1])
        case .mango:
            builder.add(ingredients: [.mango: 3])
        case .mangoKiwi:
            builder.add(ingredients: [.mango: 2, .kiwi: 1])
        }

        return builder.build()
    }
}
