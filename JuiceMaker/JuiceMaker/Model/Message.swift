//
//  Message.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/08.
//

import Foundation

enum Message {
    static let outOfStock = "재료가 모자라요. 재고를 수정할까요?"
    static let nonZeroStock = "재고를 0미만으로 설정 할 수 없습니다"
    
    static func completeMakingJuice(on juice: Juice) {
        print("\(juice) 나왔습니다! 맛있게 드세요!")
    }
}
