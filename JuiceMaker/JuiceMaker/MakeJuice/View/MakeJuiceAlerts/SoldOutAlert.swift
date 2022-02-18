//
//  SoldOutAlert.swift
//  JuiceMaker
//
//  Created by 정다연 on 2/17/22.
//

import Foundation

struct SoldOutAlert: UIAlertShowable {
    var alertInfo: Alert {
        return Alert(
            components: AlertComponents(
                title: "재료가 모자라요. 재고를 수정할까요?",
                message: nil,
                style: .alert
            ),
            actions: [
                AlertAction(
                    title: "예",
                    style: .default,
                    handler: nil    // 재고 수정으로 이동
                ),
                AlertAction(
                    title: "아니오",
                    style: .cancel,
                    handler: nil
                )
            ]
            
        )
    }
}
