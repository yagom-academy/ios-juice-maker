enum Fruits: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var tagNumber: Int {
        switch self {
        case .strawberry:
            return 1
        case .banana:
            return 2
        case .pineapple:
            return 3
        case .kiwi:
            return 4
        case .mango:
            return 5
        }
    }
}
