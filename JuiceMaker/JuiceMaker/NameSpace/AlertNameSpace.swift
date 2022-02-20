//
//  AlertNameSpace.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/18.
//

import Foundation

enum AlertNameSpace {
    static let completeMakeJuice = "%@가 나왔습니다! 맛있게 드세요!"
    static let notEnoughStock = "%@의 갯수가 %d개 밖에 없어요 재고를 수정할까요?"
    static let outOfStock = "%@가 없어요. 재고를 수정할까요?"
    
    enum Action {
        static let OK = "확인"
        static let no = "아니오"
        static let yes = "예"
    }
}
