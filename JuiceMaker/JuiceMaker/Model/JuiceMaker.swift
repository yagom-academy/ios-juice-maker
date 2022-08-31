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
            try fruitStore.subtractAmountOfOneIngridients(of: fruit, by: amount)
        case .strawberryBananaJuice, .mangoKiwiJuice:
            let (fruit1, amount1) = fruitJuice.juiceIngridients.first
            if let (fruit2, amount2) = fruitJuice.juiceIngridients.second {
                try fruitStore.subtractAmountOfTwoIngridients(fruit1, amount1, fruit2, amount2)
            }
        }
    }
    
    mutating func takeAnOrder(fruitJuice: FruitJuice) {
        do {
            try makeFruitJuice(of: fruitJuice)
        } catch {
            switch error {
            case ErrorHandling.underFlowOfAmount:
                debugPrint("재료가 부족합니다.")
            case ErrorHandling.notExistFruits:
                debugPrint("해당 과일이 없습니다.")
            default:
                debugPrint("Default Error Message")
            }
        }
    }
}
