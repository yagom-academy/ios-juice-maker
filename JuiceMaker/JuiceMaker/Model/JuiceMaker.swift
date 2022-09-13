class JuiceMaker {
    static let shared: JuiceMaker = JuiceMaker()
    private var fruitStore = FruitStore(fruitCount: 10)
    
    private init() { }
    
    func requestFruitStore() -> FruitStore {
        return fruitStore
    }
    
    func makeFruitJuice(of fruitJuice: FruitJuice) throws {
        if !fruitStore.isFruitListStock(fruitJuice.ingredients) {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        for (fruit, count) in fruitJuice.ingredients {
            try fruitStore.use(fruit, of: count)
        }
    }
}
