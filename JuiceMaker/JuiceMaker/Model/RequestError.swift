//
//  RequestError.swift
//  JuiceMaker
//
//  Created by 이아리 on 2021/10/18.
//

import Foundation

enum RequestError: Error {
    case wrongCount
    case fruitNotFound
    case fruitStockOut
    
    func printErrorMessage() {
        switch self {
        case RequestError.wrongCount:
            print("수량을 잘못 입력하였습니다.")
        case RequestError.fruitNotFound:
            print("선택한 과일이 존재하지 않습니다.")
        case RequestError.fruitStockOut:
            print("과일의 재고가 부족합니다.")
        }
    }
}
