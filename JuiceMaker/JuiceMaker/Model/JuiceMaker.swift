//
//  Created by Baem, Jeremy
//
//

struct JuiceMaker {
    static let sharedStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        JuiceMaker.sharedStore.useStockForRecipe(of: juice)
    }
}
