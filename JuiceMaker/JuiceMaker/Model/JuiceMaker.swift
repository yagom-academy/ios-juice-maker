struct JuiceMaker {
    private var fruitStore = FruitStore(fruitAmount: 50)
    private var fruitJuiceList: [FruitJuice: Int] = [:]
    
    init(numberOfFruitJuice: Int = 0) {
        for fruitJuice in FruitJuice.allCases {
            fruitJuiceList[fruitJuice] = numberOfFruitJuice
        }
    }
    
    mutating func bringIngridients(of fruitJuice: FruitJuice) throws {
        switch fruitJuice {
        case .strawberryBananaJuice, .mangoKiwiJuice:
            if let (fruit, amount) = fruitJuice.juiceIngridients.second {
                try fruitStore.subtractAmount(of: fruit, by: amount)
            }
            fallthrough
        case .strawberryJuice, .bananaJuice, .kiwiJuice, .pineappleJuice, .mangoJuice:
            let (fruit, amount) = fruitJuice.juiceIngridients.first
            try fruitStore.subtractAmount(of: fruit, by: amount)
            makeFruitJuice(fruitJuice: fruitJuice)
        }
    }
    
    mutating func handleMakeFruitJuiceError(fruitJuice: FruitJuice) {
        do {
            try bringIngridients(of: fruitJuice)
        } catch {
            switch error {
            case ErrorHandling.underFlowOfAmount:
                print("재료가 부족합니다.")
            case ErrorHandling.notExistFruits:
                print("해당 과일이 없습니다.")
            default:
                print("Default Error Message")
            }
        }
    }
    
    mutating func makeFruitJuice(fruitJuice: FruitJuice) {
        if let fruitJuiceNumber = fruitJuiceList[fruitJuice] {
            fruitJuiceList[fruitJuice] = fruitJuiceNumber + 1
            print("\(fruitJuice) 한잔 나왔습니다!")
            print("\(fruitJuiceNumber)개 -> ",terminator: "")
        }
        if let fruitJuiceNumber = fruitJuiceList[fruitJuice] {
            print("\(fruitJuiceNumber)개")
        }
    }
}
