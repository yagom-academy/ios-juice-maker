//
//  Created by Baem, Jeremy
//
//

struct JuiceMaker {
    static let sharedStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        JuiceMaker.sharedStore.useStockForRecipe(of: juice)
    }
    
    func requestStockAvailability(for juice: Juice) -> Bool {
        do {
            try JuiceMaker.sharedStore.checkStockAvailability(of: juice)
            return true
        } catch StockError.notEnoughFruit {
            print("재고 부족")
        } catch {
            print("Unknown Error")
        }
        return false
    }
}
