//
//  JuiceIsMadeAlertController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/18.
//

import UIKit

class JuiceIsMadeAlertController: UIAlertController {
    
    
    func juiceIsMade(using juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "쥬스 완성", message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert) //
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        //present(alert, animated: true, completion: nil)
        return alert
    }

    
}
