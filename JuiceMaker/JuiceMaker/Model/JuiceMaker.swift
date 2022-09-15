//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStock: 10)
    
    func makeJuice(to order: Juice, in view: JuiceMakerViewController) {
        do {
            for (fruit, amountOfFruit) in order.recipeOfJuice.ingredient {
                let stock = try fruitStorage.checkEmptyStock(to: fruit)
                try fruitStorage.checkStockAmount(to: stock, with: amountOfFruit)
            }
            chooseMenu(to: order)
            view.showSuccessAlert(to: order)
        } catch OrderError.outOfStock {
            view.showFailedAlert()
        } catch OrderError.emptyStock {
            view.showEmptyStockAlert()
        } catch {
            view.showUnknownErrorAlert()
        }
    }
    
    func chooseMenu(to order: Juice) {
        for (fruit, amountOfFruit) in order.recipeOfJuice.ingredient {
            fruitStorage.changeFruitStock(to: amountOfFruit, of: fruit)
        }
    }
}
