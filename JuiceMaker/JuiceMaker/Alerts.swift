//
//  Alerts.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/13.
//

import Foundation
import UIKit
extension UIViewController {
    func successAlert(_ juice: Juice) {
        let alert = UIAlertController(title: "주문 확인", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        //FIXME: 여기다 self.update()하면 label 업데이트가 안된다.. 왤까
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            alert.dismiss(animated: true, completion: nil)
        }
        present(alert, animated: true, completion: nil)
    }

    func failAlert() {
        let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default)
        let stockSettingAction = UIAlertAction(title: "예", style: .cancel)
        { action in
            let main = UIStoryboard(name: "Main", bundle: nil)
            let stockView = main.instantiateViewController(withIdentifier: "StockViewController")
            self.present(stockView, animated: false, completion: nil)
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)
        present(failAlert, animated: true, completion: nil)
    }
}


