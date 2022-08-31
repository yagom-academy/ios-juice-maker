struct JuiceMaker {
    private var fruitStore = FruitStore(fruitAmount: 50)
    private var fruitJuiceList: [FruitJuice: Int] = [:]
    
    init(numberOfFruitJuice: Int = 0) {
        for fruitJuice in FruitJuice.allCases {
            fruitJuiceList[fruitJuice] = numberOfFruitJuice
        }
    }
    
    mutating func makeFruitJuice(of fruitJuice: FruitJuice) throws {
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
    
    mutating func takeAnOrder(fruitJuice: FruitJuice) {
        do {
            try makeFruitJuice(of: fruitJuice)
        } catch {
            switch error {
            case JuiceMakerError.underFlowOfAmount:
                debugPrint(JuiceMakerError.underFlowOfAmount.rawValue)
            case JuiceMakerError.notExistFruits:
                debugPrint(JuiceMakerError.underFlowOfAmount.rawValue)
            default:
                debugPrint(JuiceMakerError.underFlowOfAmount.rawValue)
            }
        }
    }
}
