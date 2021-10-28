import Foundation

enum JuiceName: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var kor: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .strawberryBananaJuice:
            return "딸바 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .mangoKiwiJuice:
            return "망키 쥬스"
        }
    }
}

typealias ingredient = (fruit: FruitName, count: Int)

struct Juice {
    let name: JuiceName
    var count: Int = 0
    
    var recipe: [ingredient] {
        switch self.name {
        case .strawberryJuice:
            return [(.strawberry, 16)]
        case .bananaJuice:
            return [(.banana, 2)]
        case .kiwiJuice:
            return [(.kiwi, 3)]
        case .pineappleJuice:
            return [(.pineapple, 2)]
        case .strawberryBananaJuice:
            return [(.strawberry, 10), (.banana, 1)]
        case .mangoJuice:
            return [(.mango, 3)]
        case .mangoKiwiJuice:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
}

struct JuiceMaker {
    
    let store = FruitStore.shared
    
    private var recipe: [JuiceName: [ingredient]] = [:]
    
    mutating func initializeRecipe() {
        for juice in JuiceName.allCases {
            recipe[juice] = Juice(name: juice).recipe
        }
    }
    
    init() {
        initializeRecipe()
    }
    
    private mutating func findRecipe(of juiceName: JuiceName) throws -> [ingredient] {
        guard let foundRecipe = recipe[juiceName] else {
            throw JuiceMakerError.invalidMenuChoice
        }
        return foundRecipe
    }
    
    private func blendIngredient(by recipe: [ingredient]) throws {
        for ingredient in recipe {
            try store.subtractStock(count: ingredient.count, from: ingredient.fruit)
        }
    }
    
    mutating func make(juiceName: JuiceName) throws {
        let foundRecipe = try findRecipe(of: juiceName)
        try blendIngredient(by: foundRecipe)
    }
}
