import Foundation

// 과일 저장소 타입
class FruitStore {
    var juiceMaker = JuiceMaker()
    var fruitList: [Fruits: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func changeAmountOfFruits(fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
    func distinguishAmountOfFruits(fruit: Fruits, juice: FruitJuice) {
        switch fruit {
        case .strawberry:
            subtractAmountOfFruits(fruit: fruit, juice: .strawberryJuice, amount: 16)
        case .banana:
            subtractAmountOfFruits(fruit: fruit, juice: .bananaJuice, amount: 2)
        case .pineapple:
            subtractAmountOfFruits(fruit: fruit, juice: .pineappleJuice ,amount: 2)
        case .kiwi:
            subtractAmountOfFruits(fruit: fruit, juice: .kiwiJuice, amount: 3)
        case .mango:
            subtractAmountOfFruits(fruit: fruit, juice: .mangoJuice, amount: 3)
        }
        
    }
    
    func subtractAmountOfFruits(fruit: Fruits, juice: FruitJuice, amount: Int) {
        guard var targetFruit = fruitList[fruit],
              var targetJuice = juiceMaker.juiceList[juice] else {
            print("해당 과일이 없습니다.")
            return
        }
        
        if targetFruit < amount {
            print("재료가 부족합니다.")
        } else {
            targetFruit -= amount
            print(targetFruit)
            targetJuice += 1
        }
    }
}

//subtractAmountOfFruits
