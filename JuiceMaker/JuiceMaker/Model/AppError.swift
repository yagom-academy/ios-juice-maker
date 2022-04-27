enum AppError: Error {
    case lackOfInventory
    case invalidInputOfFruit
    
    var message: String {
        switch self {
        case .lackOfInventory:
            return "재고가 부족합니다."
        case .invalidInputOfFruit:
            return "그런 과일은 없습니다."
        }
    }
}
