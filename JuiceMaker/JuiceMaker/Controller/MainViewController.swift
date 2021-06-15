//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUILabels(_:)),
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(alertMakingJuiceSuccess(_:)),
                    name: NSNotification.Name(rawValue: "successAlert"), object: nil)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(alertMakingJuiceFail),
                    name: NSNotification.Name(rawValue: "failAlert"), object: nil)
        
        for fruit in Fruit.allCases {
            NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil, userInfo: ["과일종류": fruit])
        }
    }
    
    @IBAction func makeJuiceAction(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            print("버튼 타이틀 에러"); return
        }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else {
            print("쥬스 조회 에러"); return
        }
        juiceMaker.makeJuice(juice)
    }
    
    @IBAction func moveToModifyView(_ sender: Any) {
        performSegue(withIdentifier: "showStock", sender: sender)
    }
}

extension MainViewController {
    @objc func updateUILabels(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            print("userInfo 에러"); return
        }
        guard let infoValue = userInfo["과일종류"], let fruit = infoValue as? Fruit else {
            print("재고조회 에러 - userInfo"); return
        }
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(juiceMaker.store.currentStock(.strawberry))
        case .banana:
            bananaLabel.text = String(juiceMaker.store.currentStock(.banana))
        case .pineapple:
            pineappleLabel.text = String(juiceMaker.store.currentStock(.pineapple))
        case .kiwi:
            kiwiLabel.text = String(juiceMaker.store.currentStock(.kiwi))
        case .mango:
            mangoLabel.text = String(juiceMaker.store.currentStock(.mango))
        }
    }
    @objc func alertMakingJuiceSuccess(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            print("userInfo 에러"); return
        }
        guard let infoValue = userInfo["쥬스이름"], let juiceName = infoValue as? String else {
            print("쥬스이름 에러"); return
        }
        let alert = UIAlertController(title: "음료 주문 성공", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in print("주문성공 - \(juiceName)") }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion:nil)
    }
    @objc func alertMakingJuiceFail() {
        let alert = UIAlertController(title: "음료 주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
//            self.performSegue(withIdentifier: "showStock", sender: self)
            print("주문실패 -> 예: 재고수정")
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default) { _ in print("주문실패 -> 아니오") }
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion:nil)
    }
}

