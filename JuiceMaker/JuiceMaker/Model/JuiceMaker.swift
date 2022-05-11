struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func make(juiceMenu: Menu) throws {
        for (fruit, fruitCount) in juiceMenu.recipe {
            try fruitStore.subtractQuantity(fruit: fruit, by: fruitCount)
        }
    }
    
    func stockCount(of fruit: Fruit) -> String {
        return fruitStore.stockAsString(fruit: fruit)
    }
}
