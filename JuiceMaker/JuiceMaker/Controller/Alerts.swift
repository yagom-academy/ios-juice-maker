//
//  Alerts.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/13.
//

import Foundation
import UIKit

enum OrderAlert {
    static func successAlert(typeOfJuice: Juice) -> UIAlertController{
        let alert = UIAlertController(title: "주문 확인", message: "\(typeOfJuice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            alert.dismiss(animated: true, completion: nil)
        }
        return alert
    }
    
    static func failAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel)
        { action in
            guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
                return
            }
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let stockView = mainStoryboard.instantiateViewController(withIdentifier: "StockViewController")
            rootVC.present(stockView, animated: false, completion: nil)
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        return alert
    }
    
    static func saveAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil , message: "이 상태로 재고수정을 마치시겠습니까?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel){
            action in
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        return alert
    }
}
