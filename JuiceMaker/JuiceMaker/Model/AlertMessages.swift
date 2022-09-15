//
//  AlertMessages.swift
//  Created by Ash, 미니.
//

enum AlertMessages {
    static let successTitle: String = "주문 완료"
    static let failureTitle: String = "주문 오류"
    static let successMessage: String = "나왔습니다! 맛있게 드세요!"
    static let failureMessage: String = "재료가 모자라요. 재고를 수정할까요?"
    static let successConfirmMessage: String = "확인"
    static let failureConfirmMessage: String = "예"
    static let failureCancelMessage: String = "아니오"
    
    static func title(by isMaked: Bool) -> String {
        return isMaked ? successTitle : failureTitle
    }
    
    static func message(by isMaked: Bool, for juice: Juice) -> String {
        return isMaked ? "\(juice.description) \(successMessage)" : failureMessage
    }
    
    static func confirmMessage(by isMaked: Bool) -> String {
        return isMaked ? successConfirmMessage : failureConfirmMessage
    }
}
