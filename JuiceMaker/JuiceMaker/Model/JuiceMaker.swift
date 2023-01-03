//
//  JuiceMaker - JuiceMaker.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func makeJuice(juiceName: Recipe) {
        let stockAvailable = FruitStore().isStocked(juice: juiceName)
        switch stockAvailable {
        case true:
            do {
                try FruitStore().useFruit(juice: juiceName)
            } catch JuiceMakerError.invalidFruit {
                print("목록에 없는 과일입니다.")
            } catch {
                print(error.localizedDescription)
            }
        case false:
            print("재고 부족으로 쥬스를 만들 수 없습니다.")
        }
    }
}
