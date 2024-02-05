enum JuiceMenu {
    case recipe(FruitCategory, Int)
}

struct MenuList {
    var strawberryJuice: [JuiceMenu]
    var bananaJuice: [JuiceMenu]
    var pineappleJuice: [JuiceMenu]
    var kiwiJuice: [JuiceMenu]
    var mangoJuice: [JuiceMenu]
    var strawberryBananaJuice: [JuiceMenu]
    var mangoKiwiJuice: [JuiceMenu]
}

class JuiceMaker {
    private var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore(fruits: [.strawberry: 10,
                                             .banana: 10,
                                             .pineapple: 10,
                                             .kiwi: 10,
                                             .mango: 10])
    }
    
    func makeJuice(juiceMenu: [JuiceMenu]) throws {
        try fruitStore.isAvailable(menu: juiceMenu)
    }
    
    func consumeFruit(recipe: [JuiceMenu]) throws {
        try fruitStore.consumeStock(recipe: recipe)
    }
    
    func manageFruitStore(fruit: FruitCategory) -> Int {
        let stock = fruitStore.showFruitStock()
        guard let fruitStock = stock[fruit] else {
            return 0
        }
        return fruitStock
    }
}
