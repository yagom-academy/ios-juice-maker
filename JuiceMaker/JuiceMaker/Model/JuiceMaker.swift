//
//  JuiceMaker - JuiceMaker.swift
//  Created by Wonbi, woong
//



struct JuiceMaker {
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
    }
    
    
    let fruitStore = FruitStore.stockManager
    
    func takeFruit(_ fruit: Fruit, amount: Int) -> Int {
        let checkedStock = fruitStore.handOver(fruit: fruit, amount: amount)
        switch checkedStock {
        case .success(let fruitCount):
            return fruitCount
        case .failure(.invalidFruit):
            print("없는과일")
            return 0
        case .failure(.outOfStock):
            print("재고없음")
            return 0
        }
    }
    
}
