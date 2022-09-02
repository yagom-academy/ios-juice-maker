//
//  Created by Baem, Jeremy
//
//

struct JuiceMaker {
    private let store = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        if requestStockAvailability(for: juice) {
            store.useStockForRecipe(of: juice)
        }
    }
    
    func requestStockAvailability(for juice: Juice) -> Bool {
        do {
            try store.checkStockAvailability(of: juice)
            return true
        } catch StockError.notEnoughFruit {
            print("재고 부족")
        } catch StockError.outOfFruit {
            print("재고 없음")
        } catch {
            print("Unknown Error")
        }
        return false
    }
}
