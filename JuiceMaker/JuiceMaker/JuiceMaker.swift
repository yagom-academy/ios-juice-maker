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

enum JuiceMenu {
  case strawberry, banana, kiwi, pineappple, mango, strawberryBanana, mangoKiwi

  internal var ingredient: [Fruit: Int] {
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
