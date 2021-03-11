//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Tak on 2021/03/11.
//

import Foundation

enum AppError: Error {
    case outOfStock
    case unknownError
}
struct JuiceMaker {
    func makeJuice(juice: JuiceRecipe.Recipe) throws {
        
        switch juice {
        case JuiceRecipe.strawberryJuiceRecipe:
            if FruitType.strawberry.quantity >= JuiceRecipe.strawberryJuiceRecipe[0].requiredQuantity {
                FruitType.strawberry.useStock(amount: JuiceRecipe.strawberryJuiceRecipe[0].requiredQuantity)
            }
        default: ()
        }
    }
}
