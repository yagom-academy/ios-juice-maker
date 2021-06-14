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
    
    @IBOutlet weak var strawberryBananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    
    let maker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryBananaButton.tag = 1
        mangoKiwiButton.tag = 2
        strawberryButton.tag = 3
        bananaButton.tag = 4
        mangoButton.tag = 5
        kiwiButton.tag = 6
        pineappleButton.tag = 7
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUI),
                    name: NSNotification.Name(rawValue: "updateUI"),
                    object: nil)
        
        updateUI()

    }
    
    @IBAction func makeJuiceAction(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else {
            NSLog("버튼 에러")
            return
        }
        do {
            try maker.makeJuice(juice)
            successAlert(juice.description)
        } catch {
            print(error)
            failAlert()
        }
    }
    
    @IBAction func modifyStocks(_ sender: Any) {
        performSegue(withIdentifier: "showStock", sender: sender)
    }
}

extension MainViewController {
    @objc func updateUI() {
        do {
            strawberryLabel.text = String( try maker.store.currentStock(.strawberry))
            bananaLabel.text = String( try maker.store.currentStock(.banana))
            pineappleLabel.text = String( try maker.store.currentStock(.pineapple))
            kiwiLabel.text = String( try maker.store.currentStock(.kiwi))
            mangoLabel.text = String( try maker.store.currentStock(.mango))
        } catch {
            
        }
    }
    
    func successAlert(_ juiceName: String) {
        let alert = UIAlertController(title: "음료 주문 성공", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) {(action: UIAlertAction!) -> Void in
            
            
            NSLog("주문성공")
        }
        
        alert.addAction(confirmAction)
        
        present(alert, animated: true, completion:nil)
    }
    
    func failAlert() {
       
        let alert = UIAlertController(title: "음료 주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) {(action: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "showStock", sender: self)
            
            NSLog("주문실패_재고수정")
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .default) {(action: UIAlertAction!) -> Void in
            NSLog("주문실패")
        }
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion:nil)
    }
}

