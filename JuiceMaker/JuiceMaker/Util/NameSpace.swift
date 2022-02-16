//
//  NameSpace.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import Foundation

enum StoryboadName {
    static let main = "Main"
}

enum StoryboardID {
    static let stockModifyViewController = "stockModifyViewControllerID"
}

enum AlertTitle {
    
    static let completeMakeJuice = "쥬스가 나왔습니다! 맛있게 드세요!"
    static let faliMAkeJuice = "재료가 모자라요! 재고를 수정할까요?"
    
    enum action {
        static let okay = "확인"
        static let no = "아니오"
        static let yes = "예"
    }
}
