//
//  Error.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

enum StockError: Error {
    case invalidSelection
    
    var message: String {
        switch self {
        case .invalidSelection:
            return "해당 쥬스를 만들기 위한 과일이 존재하지 않습니다."
        }
    }
}
