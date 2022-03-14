//
//  Phrases.swift
//  JuiceMaker
//
//  Created by safari and Red on 2022/03/01.
//

import Foundation

enum Phrases: String {
    case noticeTitle = "알림"
    case yes = "예"
    case no = "아니오"
    case ok = "OK"
    case questionForStockChange = "재료가 모자라요. 재고를 수정할까요?"
    case readyForJuice = " 나왔습니다! 맛있게 드세요!"
    case acceptChanges = "정말로 재고를 수정할까요?"
    
    var text: String {
        return self.rawValue
    }
}
