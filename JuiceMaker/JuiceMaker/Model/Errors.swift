import Foundation

enum FruitStoreError: LocalizedError {
    case invalidFruitChoice
    case lackOfStock(fruitName: FruitName, neededStock: Int)
    
    var description: String {
        switch self {
        case .invalidFruitChoice:
            return "유효하지 않은 선택입니다."
        case .lackOfStock(let fruitName, let neededStock):
            return "\(fruitName.kor)\(fruitName.imoji)(이)가 \(neededStock)개 부족합니다. 재고를 확인해주세요."
        }
    }
}

enum JuiceMakerError: LocalizedError {
    case invalidMenuChoice
    
    var description: String {
        switch self {
        case .invalidMenuChoice:
            return "메뉴에 없습니다. 다시 선택해주세요."
        }
    }
}
