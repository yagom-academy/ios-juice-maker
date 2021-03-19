//
//  orderAlertController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/19.
//

import UIKit

class orderAlertController: UIAlertController {

    func alertOfSuccess(juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "\(juice.rawValue) 쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: nil)
        alert.addAction(ok)
        return alert
    }
    
    func alertOfFail() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: { (_) in 
        })
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        return alert
    }
}
