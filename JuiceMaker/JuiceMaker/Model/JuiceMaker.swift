import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(by order: Juice) {
        let juiceRecipe = order.recipe
        
        do {
            try fruitStore.isEnoughStock(for: juiceRecipe)
            fruitStore.decreaseFruitStock(by: juiceRecipe)
            print("\(order)가 완성되었습니다")
        } catch JuiceMakeError.outOfStock {
            print("과일 재고가 부족해서 쥬스 제작 불가")
        } catch {
            print("알 수 없는 문제 : \(error)")
        }
    }
}
