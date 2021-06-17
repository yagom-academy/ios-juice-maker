import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case insufficientFruit
    case unexpectedError
    
    var description: String {
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
            try fruitStore.decreaseStock(firstFruitAmount: 10, firstFruit: fruitStore.strawberry, secondFruitAmount: 1, secondFruit: fruitStore.banana)
        case .mangoKiwi:
            try fruitStore.decreaseStock(firstFruitAmount: 2, firstFruit: fruitStore.mango, secondFruitAmount: 3, secondFruit: fruitStore.kiwi)
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
}

