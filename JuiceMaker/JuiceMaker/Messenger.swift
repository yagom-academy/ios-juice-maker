//
//  Messenger.swift
//  JuiceMaker
//
//  Created by 김태형 on 2020/11/27.
//

import Foundation

enum AlertMessage: String {
    case outOfStock = "재고가 부족합니다. 재고를 수정할까요?"
    case wrongRequest = "잘못된 요청입니다. 재고 수량은 0미만으로 지정할 수 없습니다."
    case successMade = " 나왔습니다. 맛있게 드세요."
    case machineBreakdown = "관리자에게 문의하세요."
}

enum AlertCase: Error {
    case outOfStock
    case wrongRequest
    case successMade
}

class Messenger {
    func printAlertMessage(alertCase: AlertCase) {
        switch alertCase {
        case .outOfStock:
            print(AlertMessage.outOfStock.rawValue)
        case .wrongRequest:
            print(AlertMessage.wrongRequest.rawValue)
        default:
            return
        }
    }
    
    func printSuccessMade(orderedJuiceName: Menu) {
        print("\(orderedJuiceName.rawValue)" + AlertMessage.successMade.rawValue)
    }
}
