//
//  DefaultAlert.swift
//  JuiceMaker
//
//  Created by momo on 2022/02/19.
//

import UIKit

struct DefaultAlert: UIAlertShowable {
    var alertInfo: Alert {
        return Alert(
            components: AlertComponents(
                title: "일시적인 오류가 발생했습니다.",
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
