//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Seungjin Baek on 2021/03/12.
//

import Foundation


typealias FruitTypeAndAmount = [(String, Int)]

class RecipeBook {

    private let recipes: [JuiceRecipe] = [StrawberryJuice(), BananaJuice(), KiwiJuice(), PineappleJuice(), StrawberryBananaJuice(), MangoJuice(), MangoKiwiJuice()]

    func getJuiceIngredients(of juiceName: String) -> FruitTypeAndAmount? {
        return recipes.first(where: { $0.name == juiceName })?.recipe
    }
}

protocol JuiceRecipe {
    var name: String { get }
    var recipe: FruitTypeAndAmount { get }
}

extension JuiceRecipe {
    var name: String {
        return String(describing: self)
    }
}

struct StrawberryJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("strawberry", 16)]
    }
}

struct BananaJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("banana", 2)]
    }
}

struct KiwiJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("kiwi", 3)]
    }
}

struct PineappleJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("kiwi", 3)]
    }
}

struct StrawberryBananaJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("kiwi", 3)]
    }
}

struct MangoJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("kiwi", 3)]
    }
}

struct MangoKiwiJuice: JuiceRecipe {
    var recipe: FruitTypeAndAmount {
        return [("kiwi", 3)]
    }
}
