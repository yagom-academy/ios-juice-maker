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
    
    let maker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUILabels(_:)),
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(successAlert(_:)),
                    name: NSNotification.Name(rawValue: "successAlert"), object: nil)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(failAlert),
                    name: NSNotification.Name(rawValue: "failAlert"), object: nil)
        
        updateUILabels(Notification(name: NSNotification.Name(rawValue: "updateUILabels"), object: nil))
    }
    
    @IBAction func makeJuiceAction(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else { print("버튼 타이틀 에러"); return }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else { print("쥬스 조회 에러"); return }
        maker.makeJuice(juice)
    }
    
    @IBAction func modifyStocks(_ sender: Any) {
        performSegue(withIdentifier: "showStock", sender: sender)
    }
}

extension MainViewController {
    @objc func updateUILabels(_ notification: Notification) {
        if let info = notification.userInfo {
            guard let infoValue = info["과일종류"], let fruit = infoValue as? Fruit else { print("재고조회 에러 - userInfo"); return }
            switch fruit {
            case .strawberry:
                strawberryLabel.text = String(maker.store.currentStock(.strawberry))
            case .banana:
                bananaLabel.text = String(maker.store.currentStock(.banana))
            case .pineapple:
                pineappleLabel.text = String(maker.store.currentStock(.pineapple))
            case .kiwi:
                kiwiLabel.text = String(maker.store.currentStock(.kiwi))
            case .mango:
                mangoLabel.text = String(maker.store.currentStock(.mango))
            }
        } else {
            strawberryLabel.text = String(maker.store.currentStock(.strawberry))
            bananaLabel.text = String(maker.store.currentStock(.banana))
            pineappleLabel.text = String(maker.store.currentStock(.pineapple))
            kiwiLabel.text = String(maker.store.currentStock(.kiwi))
            mangoLabel.text = String(maker.store.currentStock(.mango))
        }
    }
    @objc func successAlert(_ notification: Notification) {
        guard let info = notification.userInfo, let juiceName = info["쥬스이름"] else { print("쥬스이름 에러"); return }
        let alert = UIAlertController(title: "음료 주문 성공", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) {(action: UIAlertAction!) -> Void in print("주문성공 - \(juiceName)") }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion:nil)
    }
    @objc func failAlert() {
        let alert = UIAlertController(title: "음료 주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) {(action: UIAlertAction!) -> Void in
//            self.performSegue(withIdentifier: "showStock", sender: self)
            NSLog("주문실패 -> 재고수정")
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .default) {(action: UIAlertAction!) -> Void in print("주문실패") }
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion:nil)
    }
}

