//  Created by 애종,질리,벨라 on 2022/08/30.

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango:10
    ]
    
    func updateFruitStock(fruit: Fruit, oper: String) {
        guard let targetStock = fruitStock[fruit] else {
            return
        }
        if oper == "+" {
            self.fruitStock[fruit] = targetStock + 1
        } else if targetStock > 0 {
            self.fruitStock[fruit] = targetStock - 1
        }
    }
}
