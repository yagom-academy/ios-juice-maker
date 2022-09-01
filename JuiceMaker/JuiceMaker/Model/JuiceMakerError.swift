import Foundation
enum JuiceMakerError: Error {
    case underFlowOfAmount
    case notExistFruits
    case unExpectedError
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .underFlowOfAmount:
            return NSLocalizedString("재료가 부족합니다.", comment: "")
        case .notExistFruits:
            return NSLocalizedString("해당 과일이 없습니다.", comment: "")
        case .unExpectedError:
            return NSLocalizedString("예상치 못한 에러입니다.", comment: "")
        }
    }
}
