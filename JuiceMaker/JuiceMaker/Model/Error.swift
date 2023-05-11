//
//  JuiceMaker - Error.swift
//  Created by Min Hyun on 2023/05/09.
//  last modified by maxhyunm, kobe
//

enum StockError: Error {
    case outOfStock
    case fruitNotFound
    case unKnown

    var message: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .fruitNotFound:
            return "품목에 없는 과일입니다."
        case .unKnown:
            return "알 수 없는 오류입니다."
        }
    }
}
