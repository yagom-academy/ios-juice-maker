class JuiceMaker {
    static let shared: JuiceMaker = JuiceMaker()
    private var fruitStore = FruitStore(fruitCount: 10)
    var fruitList: [Fruits: Int] {
        return fruitStore.fruitList
    }
    
    private init() { }
    
    func makeFruitJuice(of fruitJuice: FruitJuice) throws {
        if !fruitStore.isFruitListStock(fruitJuice.ingredients) {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        for (fruit, count) in fruitJuice.ingredients {
            try fruitStore.use(fruit, of: count)
        }
    }
    
    func requestModifyFruitCount(fruit: Fruits, count: Int) {
        fruitStore.changeCount(of: fruit, count: count)
    }
}
