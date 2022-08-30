struct JuiceMaker {
    var fruitStore = FruitStore(fruitAmount: 50)
    var fruitJuiceList: [FruitJuice: Int] = [
        .strawberryJuice: 0,
        .bananaJuice: 0,
        .kiwiJuice: 0,
        .pineappleJuice: 0,
        .mangoJuice: 0,
        .strawberryBananaJuice: 0,
        .mangoKiwiJuice: 0
    ]
    
    mutating func makeFruitJuice(_ fruitJuice: FruitJuice) throws {
        try bringIngridients(of: fruitJuice)
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
            
            if let fruitJuiceNumber = fruitJuiceList[fruitJuice] {
                fruitJuiceList[fruitJuice] = fruitJuiceNumber + 1
            }
            print(fruitJuiceList)
        }
    }
    
    mutating func handleMakeFruitJuiceError(fruitJuice: FruitJuice) {
        do {
            try makeFruitJuice(fruitJuice)
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
}
