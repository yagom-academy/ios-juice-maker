
import Foundation

enum FruitStockError: LocalizedError {
    case outOfStock
    case invalidValue
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "시스템 에러"
        case .outOfStock:
            return "재료가 소진되어 주스를 만들 수 없습니다."
        }
    }
}
