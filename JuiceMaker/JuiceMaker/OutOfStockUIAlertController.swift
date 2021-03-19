//
//  OutOfStockUIAlertController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/18.
//

import UIKit

class OutOfStockUIAlertController: UIAlertController {
    
    func outOfStock() -> UIAlertController {
        let alert = UIAlertController(title: "재고부족", message: "재고가 모자라요.재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default) { (action) in
            
            
            //handler
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        return alert
    }
}
//    } catch JuiceMakerError.outOfStock {
//        let alert = UIAlertController(title: "재고부족", message: "재고가 모자라요.재고를 수정할까요?", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "예", style: .default) { (action) in
//            //handler
//        }
//        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
//        alert.addAction(ok)
//        alert.addAction(cancel)
//        present(alert, animated: true, completion: nil)
//    }
//}
