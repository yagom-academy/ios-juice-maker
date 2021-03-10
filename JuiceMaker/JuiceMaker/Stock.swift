//
//  Stock.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/10.
//

import Foundation

enum Fruit: CaseIterable {
  case strawberry, banana, pineapple, kiwi, mango
}

/// 과일 재고
struct Stock {
  typealias CalculateMethod = (Int) -> Int
  private(set) var fruits: [Fruit: Int]
  private let add: CalculateMethod = { (numberOfFruit: Int) in
    return numberOfFruit + 1
  }
  private let subtract: CalculateMethod = { (numberOfFruit: Int) in
    return numberOfFruit - 1
  }

  init() {
    fruits = [:]
    for fruit in Fruit.allCases {
      fruits[fruit] = 10
    }
  }

  /// 탭한 과일의 재고를 하나 추가 또는 제거한다.
  private mutating func adjustFruitStock(_of fruitName: Fruit,_by method: CalculateMethod) {
    guard let fruitNumberInStock = fruits[fruitName] else { fatalError() }
    if method(fruitNumberInStock) >= 0 {
    fruits.updateValue(method(fruitNumberInStock), forKey: fruitName)
    } else {
      print("재고가 부족하여 더 이상 줄일 수 없습니다.")
    }
  }
  /// make(of:) 메서드로 제작한 쥬스의 재료를 재고에서 뺀다.
  internal mutating func subtractFruitFromStock(forMaking juiceMenu: JuiceMenu) {
    for (fruit, requiredFruitNumber) in juiceMenu.ingredient {
      guard let fruitNumberInStock: Int  = fruits[fruit] else { fatalError() }
      if fruitNumberInStock >= requiredFruitNumber {
        fruits.updateValue(fruitNumberInStock - requiredFruitNumber, forKey: fruit)
        print("\(juiceMenu) 나왔습니다~")
      } else {
        print("재고가 부족하여 \(juiceMenu) juice를 만들 수 없습니다.")
      }
    }
  }
  func checkStock() {
    for (fruit, numberOfFruit) in fruits {
      print("\(fruit): \(numberOfFruit)")
    }
  }
}
