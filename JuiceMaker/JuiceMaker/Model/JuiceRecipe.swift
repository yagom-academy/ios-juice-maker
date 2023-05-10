//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/10.
//

struct JuiceRecipe {
    var juiceRecipe: [FruitStore.Juice: [FruitStore.Fruit: Int]]
    
    mutating func addRecipe(_ juice: FruitStore.Juice, fruit : FruitStore.Fruit, recipeAmount: Int) {
        juiceRecipe[juice] = [fruit: recipeAmount]
    }
    
    mutating func deleteRecipe(_ juice: FruitStore.Juice) {
        juiceRecipe.removeValue(forKey: juice)
    }
    
    mutating func changeRecipe(_ juice: FruitStore.Juice, fruit : FruitStore.Fruit, changeAmount: Int) {
        juiceRecipe[juice] = [fruit: changeAmount]
    }
    
}
