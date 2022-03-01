//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func makeJuice(fruitJuice: JuiceTypes, fruitStore: FruitStore) -> [JuiceTypes:Int] {
        var fruitsStock = Dictionary<JuiceTypes, Int>()
        let recipe = fruitJuice.recipe
        do  {
            fruitsStock = try fruitStore.consumeFruit(recipe: recipe)
        } catch JuiceMakerError.outOfStock {
        } catch JuiceMakerError.unexpectedError {
            print("예상치 못한 에러 발생")
        } catch {
        }
        return fruitsStock
    }
}
