//
//  JuiceMaker - JuiceMaker.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func makeJuice(juiceName: Recipe) {
        //재고 확인 함수
        
        do {
            try FruitStore().useFruit(juice: juiceName)
        } catch JuiceMakerError.invalidFruit {
            print("목록에 없는 과일입니다.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
