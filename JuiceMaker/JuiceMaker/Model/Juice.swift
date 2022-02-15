//
//  Juice.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
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

final class IngredientsBuilder {
    private var ingredients: Fruits = [:]

    func build() -> Fruits {
        return ingredients
    }

    func add(ingredients: Fruits) {
        self.ingredients = ingredients
    }
}

final class IngredientsDirector {
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
