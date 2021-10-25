//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        let buttonText = sender.titleLabel?.text
        
        switch buttonText {
        case "딸바쥬스 주문":
            juiceCompletionAlret(juice: .strawberryBanana)
        case "망키쥬스 주문":
            juiceCompletionAlret(juice: .mangoKiwi)
        case "딸기쥬스 주문":
            juiceCompletionAlret(juice: .strawberry)
        case "바나나쥬스 주문":
            juiceCompletionAlret(juice: .banana)
        case "파인애플쥬스 주문":
            juiceCompletionAlret(juice: .pineapple)
        case "키위쥬스 주문":
            juiceCompletionAlret(juice: .kiwi)
        case "망고쥬스 주문":
            juiceCompletionAlret(juice: .mango)
        default:
            let alret = UIAlertController(title: "오류", message: "잘못된 접근입니다.", preferredStyle: .alert)
            let cencel = UIAlertAction(title: "Cencel", style: .destructive, handler: nil)
            alret.addAction(cencel)
            present(alret, animated: true, completion: nil)
        }
        
    }
    
    func juiceCompletionAlret(juice: Juice){
        let alret = UIAlertController(title: nil, message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alret.addAction(cancel)
        present(alret, animated: true, completion: nil)
    }
    
}

