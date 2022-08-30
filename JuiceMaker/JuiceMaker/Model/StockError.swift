//
//  StockError.swift
//  Created by Wonbi, woong
//

enum StockError: Error {
    case outOfStock
    case invalidFruit
    
    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .invalidFruit:
            return "취급하지 않는 과일입니다."
        }
    }
}
