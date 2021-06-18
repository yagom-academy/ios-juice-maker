//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!

    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NotificationCenter.default.addObserver(self, selector: #selector(alertMakingJuiceSuccess(_:)),
                                               name: Notification.Name(rawValue: "makeJuiceSuccess"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(alertMakingJuiceFail),
                                               name: Notification.Name(rawValue: "makeJuiceFail"), object: nil)
        
        for fruit in Fruit.allCases {
            
        }
    }
    
    @IBAction func juiceOrder(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else { print("버튼 타이틀 에러"); return }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else { print("쥬스 구분실패"); return }
        juiceMaker.makeJuice(juice)
    }
}

extension MainViewController {
    func updateUILabel(_ fruit: Fruit) {
        let currentStock = String(juiceMaker.fruitStore.currentStock(fruit))
        switch fruit {
        case .strawberry:
            strawberryLabel.text = currentStock
        case .banana:
            bananaLabel.text = currentStock
        case .pineapple:
            pineappleLabel.text = currentStock
        case .kiwi:
            kiwiLabel.text = currentStock
        case .mango:
            mangoLabel.text = currentStock
        }
    }
    @objc func alertMakingJuiceSuccess(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            print("userInfo 에러"); return
        }
        guard let userInfoValue = userInfo["쥬스이름"], let juiceName = userInfoValue as? String else {
            print("userInfoValue 에러"); return
        }
        let alert = UIAlertController(title: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "감사합니다.", style: .default) { _ in print("주문성공")}
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    @objc func alertMakingJuiceFail() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default){ _ in print("주문실패 - 예 선택")}
        let cancelAction = UIAlertAction(title: "아니오", style: .default){ _ in print("주문실패 - 아니오 선택")}
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
