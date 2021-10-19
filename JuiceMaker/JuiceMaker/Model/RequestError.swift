//
//  RequestError.swift
//  JuiceMaker
//
//  Created by 이아리 on 2021/10/18.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case wrongCount
    case fruitNotFound
    case fruitStockOut
    
    var errorDescription: String {
        switch self {
        case RequestError.wrongCount:
            return "수량을 잘못 입력하였습니다."
        case RequestError.fruitNotFound:
            return "선택한 과일이 존재하지 않습니다."
        case RequestError.fruitStockOut:
            return "과일의 재고가 부족합니다."
        }
    }
}
