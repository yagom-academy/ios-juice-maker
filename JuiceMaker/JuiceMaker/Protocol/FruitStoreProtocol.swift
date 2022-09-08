//  Created by 애종,질리,벨라 on 2022/08/31.

protocol FruitStoreProtocol {
    func updateFruitStock(fruit: Fruit, variation: Variation, amount: Int)
    func isEnoughStock(juiceRecipe: [Juice.Recipe]) throws
    func sendFruitStock() -> FruitStock
}
