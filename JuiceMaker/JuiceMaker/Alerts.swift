//
//  Alerts.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/13.
//

import Foundation
import UIKit

func successAlert() -> UIAlertController{
    let alert = UIAlertController(title: "주문 확인", message: "쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        alert.dismiss(animated: true, completion: nil)
    }
    return alert
}

func failAlert() -> UIAlertController {
    let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
    let cancel = UIAlertAction(title: "아니오", style: .default)
    let stockSettingAction = UIAlertAction(title: "예", style: .cancel)

    failAlert.addAction(stockSettingAction)
    failAlert.addAction(cancel)
    
    return failAlert
}

