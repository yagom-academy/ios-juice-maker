//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStock: 10)
    
    func makeJuice(to order: Juice, in view: ViewController) {
        do {
            try fruitStorage.checkStockBeUsed(in: order)
            view.showSuccessAlert(to: order)
        } catch OrderError.outOfStock {
            view.showFailedAlert()
        } catch OrderError.emptyStock {
            print(OrderError.emptyStock.message)
        } catch {
            print("알 수 없는 오류입니다.")
        }
        fruitStorage.changeFruitStock(to: order)
    }
}
