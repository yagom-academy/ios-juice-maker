//  Created by 애종,질리,벨라 on 2022/08/31.

protocol FruitStoreProtocol {
    func updateFruitStock(fruit: Fruit, variation: Variation, amount: Int)
    func checkEnoughStock(juiceRecipe: [Juice.Recipe]) throws
    func sendFruitStock() -> FruitStock
}
