import Foundation

struct Juice {
    fileprivate var name: JuiceName
    fileprivate var count: Int = 0
    
    enum JuiceName {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
}

struct JuiceMaker {
    
    private enum JuiceMakerError: LocalizedError {
        case inValidMenuChoice
        
        var description: String {
            switch self {
            case .inValidMenuChoice:
                return "메뉴에 없습니다. 다시 선택해주세요."
            }
        }
    }
    
    private var store = FruitStore()
    
    private typealias ingredient = (fruit: Fruit.FruitName, count: Int)
    
    private let strawberryJuiceRecipe: [ingredient] = [(.strawberry, 16)]
    private let bananaJuiceRecipe: [ingredient] = [(.banana, 2)]
    private let kiwiJuiceRecipe: [ingredient] = [(.kiwi, 3)]
    private let pineappleJuiceRecipe: [ingredient] = [(.pineapple, 2)]
    private let strawberryBananaJuiceRecipe: [ingredient] = [(.strawberry, 10), (.banana, 1)]
    private let mangoJuiceRecipe: [ingredient] = [(.mango, 3)]
    private let mangoKiwiJuiceRecipe: [ingredient] = [(.mango, 2), (.kiwi, 1)]
    
    private lazy var recipe: [Juice.JuiceName: [ingredient]] = [
        .strawberryJuice: strawberryJuiceRecipe,
        .bananaJuice: bananaJuiceRecipe,
        .kiwiJuice: kiwiJuiceRecipe,
        .pineappleJuice: pineappleJuiceRecipe,
        .strawberryBananaJuice: strawberryBananaJuiceRecipe,
        .mangoJuice: mangoJuiceRecipe,
        .mangoKiwiJuice: mangoKiwiJuiceRecipe
    ]
    
    private mutating func findRecipe(of juiceName: Juice.JuiceName) throws -> [ingredient] {
        guard let foundRecipe = recipe[juiceName] else {
            throw JuiceMakerError.inValidMenuChoice
        }
        return foundRecipe
    }
    
    private func blendIngredient(by recipe: [ingredient]) {
        for ingredient in recipe {
            store.subtractStock(count: ingredient.count, from: ingredient.fruit)
        }
    }
    
    mutating func make(juiceName: Juice.JuiceName) {
        do {
            let foundRecipe = try findRecipe(of: juiceName)
            blendIngredient(by: foundRecipe)
        } catch JuiceMakerError.inValidMenuChoice {
            print(JuiceMakerError.inValidMenuChoice.description)
        } catch {
            print(error)
        }
    }
}
