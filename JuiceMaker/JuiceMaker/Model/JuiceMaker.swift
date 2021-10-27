import Foundation

enum JuiceName: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
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
    
    private enum JuiceMakerError: LocalizedError {
        case invalidMenuChoice
        
        var description: String {
            switch self {
            case .invalidMenuChoice:
                return "메뉴에 없습니다. 다시 선택해주세요."
            }
        }
    }
    
    private(set) var store = FruitStore()
    
    private var recipe: [JuiceName: [ingredient]] = [:]
    
    mutating func initializeRecipe() {
        for juice in JuiceName.allCases {
            recipe[juice] = Juice(name: juice).recipe
        }
    }
    
    private mutating func findRecipe(of juiceName: JuiceName) throws -> [ingredient] {
        guard let foundRecipe = recipe[juiceName] else {
            throw JuiceMakerError.invalidMenuChoice
        }
        return foundRecipe
    }
    
    private func blendIngredient(by recipe: [ingredient]) {
        for ingredient in recipe {
            store.subtractStock(count: ingredient.count, from: ingredient.fruit)
        }
    }
    
    mutating func make(juiceName: JuiceName) {
        do {
            let foundRecipe = try findRecipe(of: juiceName)
            blendIngredient(by: foundRecipe)
        } catch JuiceMakerError.invalidMenuChoice {
            print(JuiceMakerError.invalidMenuChoice.description)
        } catch {
            print(error)
        }
    }
    
    init() {
        initializeRecipe()
    }
}
