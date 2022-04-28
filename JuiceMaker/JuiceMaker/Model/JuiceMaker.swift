struct JuiceMaker {
    let fruitStore = FruitStore(quantity: 10)
    
    func make(juice juiceMenu: Menu) throws {
        for (fruit, fruitCount) in juiceMenu.recipe() {
            try fruitStore.subtractQuantity(fruit: fruit, by: fruitCount)
        }
    }
}
