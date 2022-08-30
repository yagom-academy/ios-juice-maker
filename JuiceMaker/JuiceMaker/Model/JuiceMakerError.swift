import Foundation

enum JuiceMakerError: Error {
    case stockShortage
}

extension JuiceMakerError {
    var errorDescription: String {
        switch self {
        case .stockShortage:
            return "재고 부족"
        }
    }
}
