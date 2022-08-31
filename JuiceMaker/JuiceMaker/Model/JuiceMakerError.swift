enum JuiceMakerError: String, Error {
    case underFlowOfAmount = "재료가 부족합니다."
    case notExistFruits = "해당 과일이 없습니다."
    case unExpectedError = "예상치 못한 에러입니다."
}
