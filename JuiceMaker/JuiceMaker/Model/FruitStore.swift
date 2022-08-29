import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitList: [Fruits: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func changeAmountOfFruits(fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
//    mutating func subtractAmountOfFruits(fruit: Fruits, amount: Int) {
//        if fruitList[fruit] != nil {
//            fruitList[fruit] ?? 0 -= amount
//        } else {
//            print("해당 과일이 없습니다.")
//        }
//    }
}
