//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by Jinho Choi on 2020/11/24.
//

import Foundation

class FruitStock {
    private(set) var strawberry: UInt
    private(set) var banana: UInt
    private(set) var pineapple: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    
    private let strawberryAmountForMakingStrawbeeryJuice: UInt = 16
    private let bananaAmountForMakingBananaJuice: UInt = 2
    private let pineappleAmountForMakingPineappleJuice: UInt = 2
    private let kiwiAmountForMakingKiwiJuice: UInt = 3
    private let mangoAmountForMakingMangoJuice: UInt = 3
    private let strawberryAmountForMakingStrawberryAndBananaJuice: UInt = 10
    private let bananaAmountForMakingStrawberryAndBananaJuice: UInt = 1
    private let kiwiAmountForMakingMangoAndKiwiJuice: UInt = 1
    private let mangoAmountForMakingMangoAndKiwiJuice: UInt = 2
    
    init(sameInitialStock: UInt) {
        self.strawberry = sameInitialStock
        self.banana = sameInitialStock
        self.pineapple = sameInitialStock
        self.kiwi = sameInitialStock
        self.mango = sameInitialStock
    }
    
    init(strawberry: UInt, banana: UInt, pineapple: UInt, kiwi: UInt, mango: UInt) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    //주스를 만들기전, 필요한만큼의 재고가 있는지 확인하는 메서드
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
    
    //주스를 만들경우 사용한 과일양만큼 재고에서 빼주는 메서드
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
    
    //재고 추가(+1) 메서드
    func addStock(eachFruit: Fruit) {
        switch eachFruit {
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
    
    //재고 빼기(-1) 메서드
    func subStock(eachFruit: Fruit) {
        switch eachFruit {
        case .strawberry:
            strawberry -= 1
        case .banana:
            banana -= 1
        case .pineapple:
            pineapple -= 1
        case .kiwi:
            kiwi -= 1
        case .mango:
            mango -= 1
        @unknown default:
            print("존재 하지 과일입니다 과일을 추가해 주세요")
        }
    }
    
    //확장성을 생각하면 아주 안좋은 코드 같은데 배열을 이용해서 출력하려면 거의 다 새로짜야 될것?같다 ㅠ
    func checkFruitStock() {
        print("딸기재고는 \(strawberry)개 남아 있습니다.")
        print("바나나재고는 \(banana)개 남아 있습니다.")
        print("파인애플재고는 \(pineapple)개 남아 있습니다.")
        print("키위재고는 \(kiwi)개 남아 있습니다.")
        print("망고재고는 \(mango)개 남아 있습니다.")
    }
}
