import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case insufficientFruit
    case unexpectedError
    
    var description: String{
        switch self {
        case .insufficientFruit:
            return "재고가 모자라요. 재고를 수정할까요?"
        default:
            return "예상치 못한 에러가 발생했습니다."
        }
    }
}

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceName) throws {
        switch juiceName{
        case .strawberryBanana:
            try fruitStore.decreaseStock(amount: 10, fruit: fruitStore.strawberry)
            try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.banana)
        case .mangoKiwi:
            try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.mango)
            try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.kiwi)
        case .strawberry:
            try fruitStore.decreaseStock(amount: 16, fruit: fruitStore.strawberry)
        case .banana:
            try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.banana)
        case .kiwi:
            try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.kiwi)
        case .pineapple:
            try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.pineapple)
        case .mango:
            try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.mango)
        }
    }

//    func makeStrawberryJuice() throws {
//        try fruitStore.decreaseStock(amount: 16, fruit: fruitStore.strawberry)
//    }
//    func makeBananaJuice() throws {
//        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.banana)
//    }
//    func makeKiwiJuice() throws {
//        try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.kiwi)
//    }
//    func makePineappleJuice() throws {
//        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.pineapple)
//    }
//    func makeMangoJuice() throws {
//        try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.mango)
//    }
//    func makeStrawberryBananaJuice() throws {
//        try fruitStore.decreaseStock(amount: 10, fruit: fruitStore.strawberry)
//        try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.banana)
//    }
//    func makeMangoKiwiJuice() throws {
//        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.mango)
//        try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.kiwi)
//    }
}

