//
//  AlertDirector.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//

import UIKit

final class AlertDirector {
    private var builder: AlertBuilder?
    
    func buildSuccessAlert(_ builder: AlertBuilder, with targetJuice: FruitJuice) -> UIAlertController {
        builder.setTitle("주스 제조성공")
        builder.setMessage("\(targetJuice.rawValue) 나왔습니다! 맛있게 드세요!")
        builder.setAlertAction(title: "네", style: .default)
        return builder.buildAlert()
    }
    
    func buildOutOfStockAlert(_ builder: AlertBuilder, completion: (() -> ())? = nil) -> UIAlertController {
        builder.setTitle("주스 제조실패")
        builder.setMessage("재료가 모자라요 재고를 수정할까요?")
        builder.setAlertAction(title: "아니오", style: .cancel)
        builder.setAlertAction(title: "네", style: .default) {
            completion?()
        }
        return builder.buildAlert()
    }
    
    func buildUnknownAlert(_ builder: AlertBuilder) -> UIAlertController {
        builder.setTitle("알 수 없는에러")
        builder.setMessage("알 수 없는에러가 발생했습니다 앱을 다시 실행해 주세요")
        builder.setAlertAction(title: "네", style: .default)
        return builder.buildAlert()
    }
}
