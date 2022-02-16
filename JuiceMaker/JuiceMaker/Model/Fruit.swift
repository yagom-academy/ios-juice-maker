//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Haeseok Lee on 2022/02/15.
//

import Foundation

protocol Fruit {
    static var name: String { get }
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
    static let name: String = "딸기"
    var counter: Int = 10
}

struct Banana: Fruit {
    static let name: String = "바나나"
    var counter: Int = 10
}

struct Kiwi: Fruit {
    static let name: String = "키위"
    var counter: Int = 10
}

struct Pineapple: Fruit {
    static let name: String = "파인애플"
    var counter: Int = 10
}

struct Mango: Fruit {
    static let name: String = "망고"
    var counter: Int = 10
}
