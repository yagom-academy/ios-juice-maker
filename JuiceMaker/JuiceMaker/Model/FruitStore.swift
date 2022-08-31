//  Created by 애종,질리,벨라 on 2022/08/30.

class FruitStore {
    var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango:10
    ]
    
    func updateFruitStock(fruit: Fruit, plusOrMinus: String, amount: Int) {
        guard let targetStock = fruitStock[fruit] else {
            return
        }
        if plusOrMinus == "+" {
            fruitStock[fruit] = targetStock + 1
        } else if targetStock >= amount {
            fruitStock[fruit] = targetStock - amount
        } else {
            print("재고변경에 실패하였습니다.")
        }
    }
}
