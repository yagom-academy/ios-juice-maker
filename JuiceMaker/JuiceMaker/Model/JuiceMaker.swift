//
//  Created by Baem, Jeremy
//
//

struct JuiceMaker {
    let store = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        store.useStockForRecipe(of: juice)
    }
    
    func requestStockAvailability(for juice: Juice) -> Bool {
        do {
            try store.checkStockAvailability(of: juice)
            return true
        } catch StockError.notEnoughFruit {
            print("재고 부족")
        } catch {
            print("Unknown Error")
        }
        return false
    }
}
