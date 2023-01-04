//
//  JuiceMaker - JuiceMaker.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func makeJuice(juiceName: Juice) -> Juice? {
        let fruitStore = FruitStore()
        let stockAvailable = fruitStore.isStocked(juice: juiceName)
        switch stockAvailable {
        case true:
            do {
                try fruitStore.useFruit(juice: juiceName)
            } catch JuiceMakerError.invalidFruit {
                print("목록에 없는 과일입니다.")
            } catch {
                print(error.localizedDescription)
            }
            print("음료가 제작되었습니다")
            return juiceName
        case false:
            print("재고 부족으로 쥬스를 만들 수 없습니다.")
        }
        return nil
    }
}
