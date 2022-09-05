class JuiceMaker {
    static let shared: JuiceMaker = JuiceMaker()
    private var fruitStore = FruitStore(fruitAmount: 50)
    
    private init() { }
    
    func makeFruitJuice(of fruitJuice: FruitJuice) throws {
        switch fruitJuice {
        case .strawberryJuice, .bananaJuice, .kiwiJuice, .pineappleJuice, .mangoJuice:
            let (fruit, amount) = fruitJuice.juiceIngridients.first
            try fruitStore.use(fruit, of: amount)
        case .strawberryBananaJuice, .mangoKiwiJuice:
            let (fruit1, amount1) = fruitJuice.juiceIngridients.first
            guard let (fruit2, amount2) = fruitJuice.juiceIngridients.second else {
                throw JuiceMakerError.notExistFruits
            }
            try fruitStore.use(firstFruit: fruit1, firstAmount: amount1, secondFruit: fruit2, secondAmount: amount2)
        }
    }
    
    func takeAnOrder(fruitJuice: FruitJuice) -> Bool {
        do {
            try makeFruitJuice(of: fruitJuice)
        } catch {
            debugPrint(error)
            return false
        }
        return true
    }
}
