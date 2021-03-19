import Foundation

enum JuiceMakerError: Error {
    case lackStock
    case invalidStock
    case unknown
}

extension JuiceMakerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .lackStock:
            return "재료가 모자라요\n 재고를 수정할까요?"
        case .invalidStock:
            return "저장소 접근에 실패했습니다."
        case .unknown:
            return "알 수 없는 오류입니다."
        }
    }
}

