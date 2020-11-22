//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum FruitType: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    case none
}

enum FruitsJuice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸기바나나쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    case none
}

class Fruits {
    let fruitType: FruitType
    private(set) var stock: Int
    
    init(fruitType: FruitType, stock: Int = 10){
        self.fruitType = fruitType
        self.stock = stock
    }

    func add(stock amount: Int) {
        self.stock += amount
    }
    
    func use(stock amount: Int) {
        self.stock -= amount
    }
    
    func isStockUsable(needAmount: Int) -> Bool {
        guard needAmount <= stock else {
           return false
        }
        return true
    }
}

struct JuiceReceipt {
    let name: FruitsJuice
    let fruits: [FruitsNeedToMakeRecipe]
    init(name: FruitsJuice, fruits: [FruitsNeedToMakeRecipe]) {
        self.name = name
        self.fruits = fruits
    }
}

struct FruitsNeedToMakeRecipe {
    let name: FruitType
    let need: Int
    init(name: FruitType, need: Int){
        self.name = name
        self.need = need
    }
}

class StockManager {
    private(set) var strawberry = Fruits(fruitType: .strawberry)
    private(set) var banana = Fruits(fruitType: .banana)
    private(set) var pineapple = Fruits(fruitType: .pineapple)
    private(set) var kiwi = Fruits(fruitType: .kiwi)
    private(set) var mango = Fruits(fruitType: .mango)
    
    private let strawberryJuice = JuiceReceipt(name: .strawberryJuice, fruits: [.init(name: .strawberry, need: 10)])
    private let bananaJuice = JuiceReceipt(name: .bananaJuice, fruits: [.init(name: .banana, need: 2)])
    private let kiwiJuice = JuiceReceipt(name: .kiwiJuice, fruits: [.init(name: .kiwi, need: 3)])
    private let pineappleJuice = JuiceReceipt(name: .pineappleJuice, fruits: [.init(name: .pineapple, need: 2)])
    private let mangoJuice = JuiceReceipt(name: .mangoKiwiJuice, fruits: [.init(name: .mango, need: 3)])
    private let strawberryBananaJuice = JuiceReceipt(name: .strawberryBananaJuice,
                                                    fruits: [.init(name: .strawberry, need: 10),
                                                             .init(name: .banana, need: 1)])
    private let mangoKiwiJuice = JuiceReceipt(name: .mangoKiwiJuice,
                                             fruits: [.init(name: .mango, need: 2),
                                                      .init(name: .kiwi, need: 1)])
    
    private var juiceReceipt = JuiceReceipt(name: .none, fruits: [.init(name: .none, need: 0)])
    
    func orderCheck(menu: FruitsJuice) {
        switch menu {
        case .strawberryJuice:
            juiceReceipt = strawberryJuice
        case .bananaJuice:
            juiceReceipt = bananaJuice
        case .kiwiJuice:
            juiceReceipt = kiwiJuice
        case .pineappleJuice:
            juiceReceipt = pineappleJuice
        case .mangoJuice:
            juiceReceipt = mangoJuice
        case .strawberryBananaJuice:
            juiceReceipt = strawberryBananaJuice
        case .mangoKiwiJuice:
            juiceReceipt = mangoKiwiJuice
        default:
            return
        }
    }
    
    func canMakeJuice(fruit: FruitType, amount: Int) -> Bool {
        switch fruit {
        case .strawberry:
            return strawberry.isStockUsable(needAmount: amount)
        case .banana:
            return banana.isStockUsable(needAmount: amount)
        case .pineapple:
            return pineapple.isStockUsable(needAmount: amount)
        case .kiwi:
            return kiwi.isStockUsable(needAmount: amount)
        case .mango:
            return mango.isStockUsable(needAmount: amount)
        default:
            return false
        }
    }
    
    func checkCanMakeJuice() throws {
        for item in 0..<juiceReceipt.fruits.count {
            guard canMakeJuice(fruit: juiceReceipt.fruits[item].name, amount: juiceReceipt.fruits[item].need) else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    func makingJuice(_ menuName: FruitsJuice) {
        switch menuName {
        case .strawberryJuice:
            strawberry.use(stock: juiceReceipt.fruits[0].need)
        case .bananaJuice:
            banana.use(stock: juiceReceipt.fruits[0].need)
        case .kiwiJuice:
            kiwi.use(stock: juiceReceipt.fruits[0].need)
        case .mangoJuice:
            mango.use(stock: juiceReceipt.fruits[0].need)
        case .pineappleJuice:
            pineapple.use(stock: juiceReceipt.fruits[0].need)
        case .strawberryBananaJuice:
            strawberry.use(stock: juiceReceipt.fruits[0].need)
            banana.use(stock: juiceReceipt.fruits[1].need)
        case .mangoKiwiJuice:
            mango.use(stock: juiceReceipt.fruits[0].need)
            kiwi.use(stock: juiceReceipt.fruits[1].need)
        default:
            return
        }
    }
    
    func manageStock(fruit: FruitType, amount: Int) {
        switch fruit{
        case .strawberry:
            strawberry.add(stock: amount)
        case .banana:
            banana.add(stock: amount)
        case .pineapple:
            pineapple.add(stock: amount)
        case .kiwi:
            kiwi.add(stock: amount)
        case .mango:
            mango.add(stock: amount)
        default:
            return
        }
    }
}

class JuiceMaker {
    let stockManager = StockManager()
    
    func makeJuice(orderedJuice: FruitsJuice) throws {
        stockManager.orderCheck(menu: orderedJuice)
        try stockManager.checkCanMakeJuice()
        stockManager.makingJuice(orderedJuice)
    }
}


