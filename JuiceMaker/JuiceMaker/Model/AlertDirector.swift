//
//  AlertDirector.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//

import UIKit

final class AlertDirector {
    private var builder: Builder?
    
    func buildSuccessAlert(_ builder: Builder, with targetJuice: FruitJuice) {
        _ = builder
            .setTitle("주스 제조성공")
            .setMessage("\(targetJuice.rawValue) 나왔습니다! 맛있게 드세요!")
            .setAlertAction(title: "네", style: .default)
    }
    
    func buildOutOfStockAlert(_ builder: Builder) {
        _ = builder
            .setTitle("주스 제조실패")
            .setMessage("재료가 모자라요 재고를 수정할까요?")
            .setAlertAction(title: "아니오", style: .cancel)
            .setAlertAction(title: "네", style: .default)
    }
    
    func buildUnknownAlert(_ builder: Builder) {
        _ = builder
            .setTitle("알 수 없는에러")
            .setMessage("알 수 없는에러가 발생했습니다 앱을 다시 실행해 주세요")
            .setAlertAction(title: "네", style: .default)
    }
}
