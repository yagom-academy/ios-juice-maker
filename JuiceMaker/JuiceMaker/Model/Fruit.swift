//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Haeseok Lee on 2022/02/15.
//

import Foundation

protocol Fruit {
    var description: String { get }
    var counter: Int { get set }
}

extension Fruit {
    mutating func update(num: Int) {
        self.counter = num
    }
    
    mutating func increase(num: Int) {
        self.counter += num
    }
    
    mutating func decrease(num: Int) {
        self.counter -= num
    }
}

struct Strawberry: Fruit {
    let description: String = "딸기"
    var counter: Int = 0
}

struct Banana: Fruit {
    let description: String = "바나나"
    var counter: Int = 0
}

struct Kiwi: Fruit {
    let description: String = "키위"
    var counter: Int = 0
}

struct Pineapple: Fruit {
    let description: String = "파인애플"
    var counter: Int = 0
}

struct Mango: Fruit {
    let description: String = "망고"
    var counter: Int = 0
}
