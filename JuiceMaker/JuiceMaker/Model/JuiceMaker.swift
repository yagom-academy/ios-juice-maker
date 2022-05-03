struct JuiceMaker {
    let fruitStore = FruitStore(quantity: 10)
    
    func make(juiceMenu: Menu) throws {
        for (fruit, fruitCount) in juiceMenu.recipe {
            try fruitStore.subtractQuantity(fruit: fruit, by: fruitCount)
        }
    }
    
    func stockCount(of fruit: Fruit) -> String {
        return fruitStore.stockAsString(fruit: fruit)
    }
    
    func remainStock() -> [Fruit: Int] {
        return fruitStore.remainStock()
    }
}
