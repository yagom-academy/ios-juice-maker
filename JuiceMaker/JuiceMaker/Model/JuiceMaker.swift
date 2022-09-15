//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStock: 10)
    
    func makeJuice(to order: Juice, in view: JuiceMakerViewController) {
        for (fruit, amountOfFruit) in order.recipeOfJuice.ingredient {
            do {
                let stock = try fruitStorage.checkEmptyStock(to: fruit)
                try chooseMenu(to: order, of: stock)
                fruitStorage.changeFruitStock(to: stock, to: amountOfFruit, of: fruit)
                view.showSuccessAlert(to: order)
            } catch OrderError.outOfStock {
                view.showFailedAlert()
            } catch OrderError.emptyStock {
                view.showEmptyStockAlert()
            } catch {
                view.showUnknownErrorAlert()
            }
        }
    }
    
    func chooseMenu(to order: Juice, of stock: Int) throws {
        for (fruit, amountOfFruit) in order.recipeOfJuice.ingredient {
            let check = fruitStorage.checkStockBeforeUsed(to: stock, with: amountOfFruit) 
            if check == false {
                throw OrderError.outOfStock
            }
        }
    }
}
