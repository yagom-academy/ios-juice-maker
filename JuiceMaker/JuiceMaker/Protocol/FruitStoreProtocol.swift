//  Created by 애종,질리,벨라 on 2022/08/31.

protocol FruitStoreProtocol {
    func updateFruitStock(fruit: Fruit, variation: Variation)
    func subtractFruitStock(fruit: Fruit, amount: Int)
    func isEnoughStock(juiceRecipe: (Fruit, Int)) -> Bool
}
