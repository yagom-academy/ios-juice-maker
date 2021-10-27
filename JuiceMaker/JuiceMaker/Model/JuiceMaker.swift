
struct JuiceMaker {

    let fruitStore: FruitStore
    
    init() {
        fruitStore = FruitStore.shared
    }
    
    private func checkStock(juice: Juices) throws {
        for (fruit, amount) in juice.recipe {
            guard fruitStore.hasEnoughFruit(which: fruit, on: amount) == true else {
                throw FruitStockError.outOfStock
            }
        }
    }
    
    func makeJuice(juice: Juices) throws {
        try checkStock(juice: juice)
        for (fruit, amount) in juice.recipe {
            fruitStore.useFruit(fruit: fruit, amount: amount)
        }
    }
}


