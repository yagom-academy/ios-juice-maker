//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct JuiceMaker {
    private let fruitStorage = FruitStore()
    
    func makeJuice(of juice: Juice) {
        do {
            try fruitStorage.checkStockWhenWeUse(in: juice)
        } catch OrderError.outOfStock {
            print(OrderError.outOfStock.message)
        } catch OrderError.emptyStock {
            print(OrderError.emptyStock.message)
        } catch {
            print("알 수 없는 오류입니다.")
        }
        fruitStorage.changeFruitStock(to: juice)
    }
}
