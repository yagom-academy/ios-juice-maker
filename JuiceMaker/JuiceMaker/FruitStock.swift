//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by Jinho Choi on 2020/11/24.
//

import Foundation

/// 과일의 재고와 관련된 모든것을 처리하는 클래스
class FruitStock {
    private(set) var strawberry: UInt
    private(set) var banana: UInt
    private(set) var pineapple: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    
    private var fruitList: [Fruit: UInt] = [:]
    
    private let strawberryAmountForMakingStrawbeeryJuice: UInt = 16
    private let bananaAmountForMakingBananaJuice: UInt = 2
    private let pineappleAmountForMakingPineappleJuice: UInt = 2
    private let kiwiAmountForMakingKiwiJuice: UInt = 3
    private let mangoAmountForMakingMangoJuice: UInt = 3
    private let strawberryAmountForMakingStrawberryAndBananaJuice: UInt = 10
    private let bananaAmountForMakingStrawberryAndBananaJuice: UInt = 1
    private let kiwiAmountForMakingMangoAndKiwiJuice: UInt = 1
    private let mangoAmountForMakingMangoAndKiwiJuice: UInt = 2
    
    /// 과일 모두 같은 양의 재고를 초깃값으로 가질 경우
    init(sameInitialStock: UInt) {
        self.strawberry = sameInitialStock
        self.banana = sameInitialStock
        self.pineapple = sameInitialStock
        self.kiwi = sameInitialStock
        self.mango = sameInitialStock
    }
    
    /// 과일마다 각기 다른 초깃값을 가질 경우
    init(strawberry: UInt, banana: UInt, pineapple: UInt, kiwi: UInt, mango: UInt) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    /**
     쥬스를 만들기 전, 필요한 만큼의 재고가 있는지 확인하는 메서드
     # Parameters:
        - menu: 만들수 있는 상태인지 확인하고 싶은 쥬스매뉴
     */
    func canMakeJuice(menu: JuiceMenu) -> Bool {
        switch menu {
        case .strawberryJuice:
            return (strawberry >= strawberryAmountForMakingStrawbeeryJuice) ? true : false
        case .bananaJuice:
            return (banana >= bananaAmountForMakingBananaJuice) ? true : false
        case .pineappleJuice:
            return (pineapple >= pineappleAmountForMakingPineappleJuice) ? true : false
        case .kiwiJuice:
            return (kiwi >= kiwiAmountForMakingKiwiJuice) ? true : false
        case .mangoJuice:
            return (mango >= mangoAmountForMakingMangoJuice) ? true : false
        case .strawberryAndBananaJuice:
            return (strawberry >= strawberryAmountForMakingStrawberryAndBananaJuice && banana >= bananaAmountForMakingStrawberryAndBananaJuice) ? true : false
        case .mangoAndKiwiJuice:
            return (kiwi >= kiwiAmountForMakingMangoAndKiwiJuice && mango >= mangoAmountForMakingMangoAndKiwiJuice) ? true : false
        @unknown default:
            print("존재 하지 않는 메뉴입니다. 메뉴를 추가해 주십시오")
            return false
        }
    }
    
    /**
     쥬스를 만든 경우 사용한 과일 양만큼 재고에서 빼주는 메서드
     # Parameters:
        - for menu: 만든 쥬스매뉴
     */
    func useFruitStock(for menu: JuiceMenu) {
        switch menu {
        case .strawberryJuice:
            strawberry -= strawberryAmountForMakingStrawbeeryJuice
        case .bananaJuice:
            banana -= bananaAmountForMakingBananaJuice
        case .pineappleJuice:
            pineapple -= pineappleAmountForMakingPineappleJuice
        case .kiwiJuice:
            kiwi -= kiwiAmountForMakingKiwiJuice
        case .mangoJuice:
            mango -= mangoAmountForMakingMangoJuice
        case .strawberryAndBananaJuice:
            strawberry -= strawberryAmountForMakingStrawberryAndBananaJuice
            banana -= bananaAmountForMakingStrawberryAndBananaJuice
        case .mangoAndKiwiJuice:
            kiwi -= kiwiAmountForMakingMangoAndKiwiJuice
            mango -= mangoAmountForMakingMangoAndKiwiJuice
        @unknown default:
            print("존재 하지 않는 메뉴입니다. 메뉴를 추가해 주십시오")
        }
    }
    
    /**
     재고에 더하기(+1) 메서드
     # Parameters:
        - to: +1 해주고자 하는 과일
     */
    func addOneStock(to: Fruit) {
        switch to {
        case .strawberry:
            strawberry += 1
        case .banana:
            banana += 1
        case .pineapple:
            pineapple += 1
        case .kiwi:
            kiwi += 1
        case .mango:
            mango += 1
        @unknown default:
            print("존재 하지 과일입니다 과일을 추가해 주세요")
        }
    }
    
    /**
     재고에 빼기(-1) 메서드
     # Parameters:
        - from: -1 해주고자 하는 과일
     */
    func subtractOneStock(from: Fruit) {
        switch from {
        case .strawberry:
            guard strawberry != 0 else {
                // alert으로 구현해 주면 사용자가 확인하기 더 용이할 것 같다. 추후 수정
                print("딸기 재고가 없기 때문에 빼줄 수 없습니다.")
                return
            }
            strawberry -= 1
        case .banana:
            guard banana != 0 else {
                print("바나나 재고가 없기 때문에 빼줄 수 없습니다.")
                return
            }
            banana -= 1
        case .pineapple:
            guard pineapple != 0 else {
                print("파인애플 재고가 없기 때문에 빼줄 수 없습니다.")
                return
            }
            pineapple -= 1
        case .kiwi:
            guard kiwi != 0 else {
                print("키위 재고가 없기 때문에 빼줄 수 없습니다.")
                return
            }
            kiwi -= 1
        case .mango:
            guard mango != 0 else {
                print("망고 재고가 없기 때문에 빼줄 수 없습니다.")
                return
            }
            mango -= 1
        @unknown default:
            print("존재 하지 과일입니다 과일을 추가해 주세요")
        }
    }
    
    /// 과일 재고를 로그로 출력하기전 딕셔너리에 담아 재고를 update하는 메서드
    func putFruit() {
        fruitList[.strawberry] = strawberry
        fruitList[.banana] = banana
        fruitList[.pineapple] = pineapple
        fruitList[.kiwi] = kiwi
        fruitList[.mango] = mango
    }
    
    /// 과일 재고를 로그로 출력하는 메서드
    func checkFruitStock() {
        putFruit()
        for fruit in fruitList {
            print("\(fruit.key)는 \(fruit.value)개 남아 있습니다.")
        }
    }
}
