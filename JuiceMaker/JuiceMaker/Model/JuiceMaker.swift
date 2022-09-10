//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStock: 10)
    
    func makeJuice(to order: Juice, in view: ViewController) {
        for (fruit, amountOfFruit) in order.recipeOfJuice.ingredient {
            do {
                let stock = try fruitStorage.checkEmptyStock(to: fruit)
                let remainingStock = try fruitStorage.checkStockAmount(to: stock, with: amountOfFruit)
                fruitStorage.changeFruitStock(to: remainingStock, to: fruit)
                view.showSuccessAlert(to: order) // 최종 목적지
            } catch OrderError.outOfStock {
                view.showFailedAlert()
            } catch OrderError.emptyStock {
                view.showEmptyStockAlert()
            } catch {
                print("알 수 없는 오류입니다.")
            }
        }
    }
}
