//
//  AlertMessage.swift
//  JuiceMaker
//
//  Created by SeoDongyeon on 2022/03/01.
//

enum AlertMessage {
    case cameOut
    case outOfStock
    case enjoyDrink
    case editStock
    case check
    case yes
    case no
    
    var description: String {
        switch self {
        case .cameOut:
            return " 나왔습니다!"
        case .outOfStock:
            return "재료가 모자라요"
        case .enjoyDrink:
            return "맛있게 드세요!"
        case .editStock:
            return "재고를 수정할까요?"
        case .check:
            return "확인"
        case .yes:
            return "네"
        case .no:
            return "아니오"
        }
    }
}
