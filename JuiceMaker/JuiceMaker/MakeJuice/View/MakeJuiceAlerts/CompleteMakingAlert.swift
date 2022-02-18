//
//  CompleteMakingAlert.swift
//  JuiceMaker
//
//  Created by 정다연 on 2/17/22.
//

import Foundation

struct CompleteMakingAlert: UIAlertShowable {
    var alertInfo: Alert {
        return Alert(
            components: AlertComponents(
                title: "쥬스 나왔습니다! 맛있게 드세요!",
                message: nil,
                style: .alert
            ),
            actions: [
                AlertAction(
                    title: "확인",
                    style: .default,
                    handler: nil
                )
            ]
            
        )
    }
}
