enum AppError: Error {
    case lackOfStock
    
    var message: String {
        switch self {
        case .lackOfStock:
            return "재고 부족"
        }
    }
}
