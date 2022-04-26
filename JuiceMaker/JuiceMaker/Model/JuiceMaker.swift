struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore(quantity: 10)
    
    func makeJuice(what juiceMenu: Menu?) throws {
        guard let menu = juiceMenu else {
            throw ThrowError.invalidMenu
        }
                
        for (juice, fruitCount) in menu.returnRecipe() {
            try fruitStore.subtractQuantity(fruit: juice, by: fruitCount)
        }
    }
}
