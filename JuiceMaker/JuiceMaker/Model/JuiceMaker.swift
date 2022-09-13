class JuiceMaker {
    static let shared: JuiceMaker = JuiceMaker()
    private var fruitStore = FruitStore(fruitCount: 10)
    
    private init() { }
    
    func requestFruitStore() -> FruitStore {
        return fruitStore
    }
    
    func makeFruitJuice(of fruitJuice: FruitJuice) throws {
        switch fruitJuice.ingridientCount {
        case 1:
            let (fruit, count) = fruitJuice.juiceIngridients.first
            try fruitStore.use(fruit, of: count)
        case 2:
            let (fruit1, count1) = fruitJuice.juiceIngridients.first
            guard let (fruit2, count2) = fruitJuice.juiceIngridients.second else {
                throw JuiceMakerError.notExistFruits
            }
            try fruitStore.use(firstFruit: fruit1, firstCount: count1, secondFruit: fruit2, secondCount: count2)
        default:
            return
        }
    }
}
