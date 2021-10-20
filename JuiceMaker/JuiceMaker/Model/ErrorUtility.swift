//
//  ErrorUtility.swift
//  JuiceMaker
//
//  Created by 이호영 on 2021/10/20.
//

import Foundation

extension JuiceMaker.MakingJuiceError {
    var errorDescription: String? {
        switch self {
        case .soldOut:
            return "품절되었습니다."
        }
    }
}
extension FruitStore.InventoryManageError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
