enum FruitError: Error {
    case insufficientFruit
    
    var errorDescription: String {
        switch self {
        case .insufficientFruit:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
