import Foundation

enum JuiceMakerError: Error {
    case underFlowOfAmount
    case notExistFruits
    case unExpectedError
}

extension JuiceMakerError: CustomStringConvertible {
    var description: String {
        switch self {
        case .underFlowOfAmount:
            return "재료가 부족합니다."
        case .notExistFruits:
            return "해당 과일이 없습니다."
        case .unExpectedError:
            return "예상치 못한 에러입니다."
        }
    }
}
