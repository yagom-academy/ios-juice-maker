
import Foundation

enum FruitStockError: LocalizedError {
    case outOfStock
    case invalidValue
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "시스템 에러"
        case .outOfStock:
            return "재고가 모자라요, 재고를 수정할까요?"
        }
    }
}
