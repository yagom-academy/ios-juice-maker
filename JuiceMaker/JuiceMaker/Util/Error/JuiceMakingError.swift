import Foundation

enum JuiceMakingError: Error {
    case outOfStock
}

extension JuiceMakingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
