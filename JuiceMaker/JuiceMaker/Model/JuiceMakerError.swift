enum JuiceMakerError: Error {
    case stockShortage
}

extension JuiceMakerError {
    var errorDescription: String {
        switch self {
        case .stockShortage:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
