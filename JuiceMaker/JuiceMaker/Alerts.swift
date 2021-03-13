//
//  Alerts.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/13.
//

import Foundation
import UIKit

func successAlert(_ juice: Juice) -> UIAlertController{
    let alert = UIAlertController(title: "주문 확인", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
    //FIXME: 여기다 self.update()하면 label 업데이트가 안된다.. 왤까
    //present(alert, animated: true, completion: nil)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
        alert.dismiss(animated: true, completion: nil)
    }
    return alert
}

func failAlert() -> UIAlertController {
    let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
    let cancel = UIAlertAction(title: "아니오", style: .default)
    let stockSettingAction = UIAlertAction(title: "예", style: .cancel)
    /*{ action in
     guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
     return
     }
     
     vc.modalPresentationStyle = .fullScreen
     self.present(vc,animated: true)
     }*/
    failAlert.addAction(stockSettingAction)
    failAlert.addAction(cancel)
    
    return failAlert
    //present(failAlert, animated: true, completion: nil)
}

