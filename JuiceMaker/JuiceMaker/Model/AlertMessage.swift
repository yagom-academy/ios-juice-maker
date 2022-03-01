//
//  JuiceError.swift
//  JuiceMaker
//
//  Created by SeoDongyeon on 2022/02/24.
//

enum AlertMessage {
    case cameOut
    case enjoyDrink
    case outOfStock
    case editStock
    case ok
    case yes
    case no
    
    var description: String {
        switch self {
        case .cameOut:
            return " 나왔습니다!"
        case .enjoyDrink:
            return " 맛있게 드세요!"
        case .outOfStock:
            return "재료가 모자라요"
        case .editStock:
            return "재고를 수정할까요?"
        case .ok:
            return "확인"
        case .yes:
            return "네"
        case .no:
            return "아니오"
        }
    }
}
