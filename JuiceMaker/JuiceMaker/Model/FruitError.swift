enum FruitError: Error {
    case insufficientFruit
    
    var errorDescription: String {
        switch self {
        case .insufficientFruit:
            return "과일이 부족합니다."
        }
    }
}
