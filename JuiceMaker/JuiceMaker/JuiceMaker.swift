//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class StockManager {
    private(set) var strawberry = Fruits(fruitType: .strawberry)
    private(set) var banana = Fruits(fruitType: .banana)
    private(set) var pineapple = Fruits(fruitType: .pineapple)
    private(set) var kiwi = Fruits(fruitType: .kiwi)
    private(set) var mango = Fruits(fruitType: .mango)
    
    private let strawberryJuice = Juices().fruitJuices[0]
    private let bananaJuice = Juices().fruitJuices[1]
    private let kiwiJuice = Juices().fruitJuices[2]
    private let pineappleJuice = Juices().fruitJuices[3]
    private let mangoJuice = Juices().fruitJuices[4]
    private let strawberryBananaJuice = Juices().fruitJuices[5]
    private let mangoKiwiJuice = Juices().fruitJuices[6]
    
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
            let fruit = juiceReceipt.fruits[0]
            strawberry.use(stock: fruit.need)
        case .bananaJuice:
            let fruit = juiceReceipt.fruits[0]
            banana.use(stock: fruit.need)
        case .kiwiJuice:
            let fruit = juiceReceipt.fruits[0]
            kiwi.use(stock: fruit.need)
        case .mangoJuice:
            let fruit = juiceReceipt.fruits[0]
            mango.use(stock: fruit.need)
        case .pineappleJuice:
            let fruit = juiceReceipt.fruits[0]
            pineapple.use(stock: fruit.need)
        case .strawberryBananaJuice:
            for item in 0..<juiceReceipt.fruits.count {
                let fruit = juiceReceipt.fruits[item]
                if  fruit.name == .strawberry {
                    strawberry.use(stock: fruit.need)
                }
                else if fruit.name == .banana {
                    banana.use(stock: fruit.need)
                }
            }
        case .mangoKiwiJuice:
            for item in 0..<juiceReceipt.fruits.count {
                let fruit = juiceReceipt.fruits[item]
                if  fruit.name == .mango {
                    mango.use(stock: fruit.need)
                }
                else if fruit.name == .kiwi {
                    kiwi.use(stock: fruit.need)
                }
            }
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


