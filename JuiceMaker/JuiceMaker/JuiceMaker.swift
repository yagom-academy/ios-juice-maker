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

class JuiceMaker {
    private(set) var strawberry = Fruits(fruitType: .strawberry)
    private(set) var banana = Fruits(fruitType: .banana)
    private(set) var pineapple = Fruits(fruitType: .pineapple)
    private(set) var kiwi = Fruits(fruitType: .kiwi)
    private(set) var mango = Fruits(fruitType: .mango)
    
    private let strawberryJuice = [(name: FruitType.strawberry, need: 16)]
    private let bananaJuice = [(name: FruitType.banana, need: 2)]
    private let kiwiJuice = [(name: FruitType.kiwi, need: 3)]
    private let pineappleJuice = [(name: FruitType.pineapple, need: 2)]
    private let mangoJuice = [(name: FruitType.mango, need: 3)]
    private let strawberryBananaJuice = [(name: FruitType.strawberry, need: 10), (name: FruitType.banana, need: 1)]
    private let mangoKiwiJuice = [(name: FruitType.mango, need: 2), (name: FruitType.kiwi, need: 1)]
    
    private var juiceReceipt = [(name: FruitType.none, need: 0)]
    private var juice = FruitsJuice.none
    
    func orderCheck(menu: FruitsJuice) {
        switch menu {
        case .strawberryJuice:
            juiceReceipt = strawberryJuice
            juice = FruitsJuice.strawberryJuice
        case .bananaJuice:
            juiceReceipt = bananaJuice
            juice = FruitsJuice.bananaJuice
        case .kiwiJuice:
            juiceReceipt = kiwiJuice
            juice = FruitsJuice.kiwiJuice
        case .pineappleJuice:
            juiceReceipt = pineappleJuice
            juice = FruitsJuice.pineappleJuice
        case .mangoJuice:
            juiceReceipt = mangoJuice
            juice = FruitsJuice.mangoJuice
        case .strawberryBananaJuice:
            juiceReceipt = strawberryBananaJuice
            juice = FruitsJuice.strawberryBananaJuice
        case .mangoKiwiJuice:
            juiceReceipt = mangoKiwiJuice
            juice = FruitsJuice.mangoKiwiJuice
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
    
    func makeJuice(menuName: FruitsJuice) throws {
        orderCheck(menu: menuName)
        
        for index in 0..<juiceReceipt.count {
            guard canMakeJuice(fruit: juiceReceipt[index].name, amount: juiceReceipt[index].need) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        switch menuName {
        case .strawberryJuice:
            strawberry.useStock(amount: juiceReceipt[0].need)
        case .bananaJuice:
            banana.useStock(amount: juiceReceipt[0].need)
        case .kiwiJuice:
            kiwi.useStock(amount: juiceReceipt[0].need)
        case .mangoJuice:
            mango.useStock(amount: juiceReceipt[0].need)
        case .pineappleJuice:
            pineapple.useStock(amount: juiceReceipt[0].need)
        case .strawberryBananaJuice:
            strawberry.useStock(amount: juiceReceipt[0].need)
            banana.useStock(amount: juiceReceipt[1].need)
        case .mangoKiwiJuice:
            mango.useStock(amount: juiceReceipt[0].need)
            kiwi.useStock(amount: juiceReceipt[1].need)
        default:
            return
        }
    }
    
    func manageStock(fruit: FruitType, amount: Int) {
        switch fruit{
        case .strawberry:
            strawberry.addStock(amount: amount)
        case .banana:
            banana.addStock(amount: amount)
        case .pineapple:
            pineapple.addStock(amount: amount)
        case .kiwi:
            kiwi.addStock(amount: amount)
        case .mango:
            mango.addStock(amount: amount)
        default:
            return
        }
    }
}

class Fruits {
    let fruitType: FruitType
    private(set) var fruitStock: Int
    
    init(fruitType: FruitType, fruitStock: Int = 10){
        self.fruitType = fruitType
        self.fruitStock = fruitStock
    }
    
    var getStock: Int {
        get {
            return fruitStock
        }
    }
    
    func addStock(amount: Int) {
        self.fruitStock += amount
    }
    
    func useStock(amount: Int) {
        self.fruitStock -= amount
    }
    
    func isStockUsable(needAmount: Int) -> Bool {
        guard needAmount <= fruitStock else {
           return false
        }
        return true
    }
}

