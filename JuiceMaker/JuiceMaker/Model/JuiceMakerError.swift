enum JuiceMakerError: Error {
    case stockShortage, noSuchFruit
}

extension JuiceMakerError {
    var errorDescription: String {
        switch self {
        case .stockShortage:
            return "재고 부족"
        case .noSuchFruit:
            return "해당 과일은 취급하지 않음"
        }
    }
}
