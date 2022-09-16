//  Created by 애종,질리,벨라 on 2022/08/31.

protocol JuiceMakerProtocol {
    func getFruitStock() -> FruitStock
    func make(_ juice: Juice)
    func canMakeJuice(_ recipe: [Juice.Recipe]) throws
    func updateAllFruitStock(fruitStock: FruitStock)
}
