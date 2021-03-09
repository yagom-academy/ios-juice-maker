//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 쥬스 메이커 타입
enum JuiceMakerError: Error {
  case invalidInput
}

enum Fruit: CaseIterable {
  case strawberry, banana, pineapple, kiwi, mango
}

enum JuiceMenu {
  case strawberry, banana, kiwi, pineappple, mango, strawberryBanana, mangoKiwi

  fileprivate var ingredient: [Fruit: Int] {
    switch self {
    case .strawberry:
      return [.strawberry: 16]
    case .banana:
      return [.banana: 2]
    case .kiwi:
      return [.kiwi: 3]
    case .pineappple:
      return [.pineapple: 2]
    case .mango:
      return [.mango: 3]
    case .strawberryBanana:
      return [.strawberry: 10, .banana: 1]
    case .mangoKiwi:
      return [.mango: 2, .kiwi: 1]
    }
  }
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
  fileprivate mutating func subtractFruitFromStock(forMaking juiceMenu: JuiceMenu) {
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

/// 쥬스 메이커 타입
struct JuiceMaker {
  private(set) var stock = Stock()

  /// orderJuice() 메서드에서 받은 쥬스 제작
  mutating func make(of juiceMenu: JuiceMenu) {
    // 쥬스 제작 얼럿을 화면에 표시한다.
    // 쥬스 제작에 사용된 재료를 재고에서 뺀다.
    stock.subtractFruitFromStock(forMaking: juiceMenu)
  }
  //  /// 탭한 쥬스 종류에 따른 주문을 생성
  //  func orderJuice() -> JuiceMenu {
  //    // 터치한 버튼으로 어떤 쥬스가 주문되었는지 알려준다.
  //    let orderedJuice: JuiceMenu =
  //    // 주문 받은 쥬스 쥬스메뉴 타입으로 반환한다.
  //    return orderedJuice
  //  }
  //  mutating func operateJuiceMaker() {
  //    let orderedJuice: JuiceMenu = orderJuice()
  //    make(of: orderedJuice)
  //  }
}
