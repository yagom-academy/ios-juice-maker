//
//  JuiceRecipes.swift
//  JuiceMaker
//
//  Created by Kyungmin Lee on 2020/11/21.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

struct JuiceRecipe {
    let needFruits: [Fruit: UInt]
}

// 쥬스 레시피의 프로퍼티는 인스턴스내에서 변경되지 않으므로 struct로 선언
struct JuiceRecipes {
    fileprivate var juiceRecipes: [Juice:JuiceRecipe]
    
    func juiceRecipe(of juice: Juice) -> JuiceRecipe? {
        return juiceRecipes[juice]
    }
    
    /// 레시피 수정
    /// - Returns: 쥬스의 레시피가 이미 있다면 새로운 레시피로 수정 후 원래 레시피를 반환, 없다면 새로운 레시피를 추가한 후 nil 반환
    mutating func updateRecipe(of juice: Juice, with recipe: JuiceRecipe) -> JuiceRecipe? {
        return juiceRecipes.updateValue(recipe, forKey: juice)
    }
}

// 야곰의 쥬스 레시피 상수
let yagomsJuiceRecipes: JuiceRecipes = JuiceRecipes(juiceRecipes: [
    .strawberryJuice:JuiceRecipe(needFruits: [.strawberry:16]),
    .bananaJuice:JuiceRecipe(needFruits: [.banana:2]),
    .kiwiJuice:JuiceRecipe(needFruits: [.kiwi:3]),
    .pineappleJuice:JuiceRecipe(needFruits: [.pineapple:2]),
    .strawberryBananaJuice:JuiceRecipe(needFruits: [.strawberry:10,
                                              .banana:1]),
    .mangoJuice:JuiceRecipe(needFruits: [.mango:3]),
    .mangoKiwiJuice:JuiceRecipe(needFruits: [.mango:2,
                                       .kiwi:1])
])
