import Foundation

enum JuiceMakingError: Error {
    case outOfStock
}

extension JuiceMakingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "과일재고가 부족해서 제조 불가"
        }
    }
}
