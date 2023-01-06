//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(juice: juiceMaker.getFruitsInStore())
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            return
        }
        
        switch title {
        case "딸바쥬스 주문":
            if juiceMaker.makeJuice(.strawberryBananaJuice) {
                showSuccessAlert(message: Juice.strawberryBananaJuice.name)
            } else {
                showFailureAlert()
            }
        case "딸기쥬스 주문":
            if juiceMaker.makeJuice(.strawberryJuice) {
                showSuccessAlert(message: Juice.strawberryJuice.name)
            } else {
                showFailureAlert()
            }
        case "바나나쥬스 주문":
            if juiceMaker.makeJuice(.bananaJuice) {
                showSuccessAlert(message: Juice.bananaJuice.name)
            } else {
                showFailureAlert()
            }
        case "파인애플쥬스 주문":
            if juiceMaker.makeJuice(.pineappleJuice) {
                showSuccessAlert(message: Juice.pineappleJuice.name)
            } else {
                showFailureAlert()
            }
        case "망키쥬스 주문":
            if juiceMaker.makeJuice(.mangoKiwiJuice) {
                showSuccessAlert(message: Juice.mangoKiwiJuice.name)
            } else {
                showFailureAlert()
            }
        case "키위쥬스 주문":
            if juiceMaker.makeJuice(.kiwiJuice) {
                showSuccessAlert(message: Juice.kiwiJuice.name)
            } else {
                showFailureAlert()
            }
        case "망고쥬스 주문":
            if juiceMaker.makeJuice(.mangoJuice) {
                showSuccessAlert(message: Juice.mangoJuice.name)
            } else {
                showFailureAlert()
            }
        default:
            return
        }
    }
    
    func updateLabel(juice: [Fruit: Int]) {
        guard let strawberry = juice[.strawberry],
              let banana = juice[.banana],
              let kiwi = juice[.kiwi],
              let pineapple = juice[.pineapple],
              let mango = juice[.mango] else { return }
        
        strawberryLabel.text = String(strawberry)
        bananaLabel.text = String(banana)
        kiwiLabel.text = String(kiwi)
        pineappleLabel.text = String(pineapple)
        mangoLabel.text = String(mango)
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "\(message) 나왔습니다 맛있게 드세요", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false) {
            self.updateLabel(juice: self.juiceMaker.getFruitsInStore())
        }
    }
    
    func showFailureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요 재료를 수정할까요?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .default) { (action) in
            // 추후 수정
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: false)
    }
}

