//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    let juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitCount()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: Notification.Name("changedInventory"),
            object: nil)
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) { }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        guard let juiceID = sender.restorationIdentifier else {
            return
        }
        // MARK: 변경 필요
        guard let juiceCase = JuiceMaker.Juice.allCases.filter({ $0 == juiceID }).first else {
            return
        }
        // MARK: 영어 -> 한글 변경
        guard let _ = juiceMaker.order(juice: juiceCase) else {
            alertMessage(title: "주스 제조 실패", message: "재료가 모자라요. 재고를 수정할까요?", handler:{ _ in self.presentModifyView() })
            return
        }
        alertMessage(title: "주스 제조 완료", message: "\(juiceID) 제조가 완료되었습니다.", handler: nil)
    }
    
    func alertMessage(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "확인", style: .default, handler: handler)
        let alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc
    func updateFruitCount() {
        for fruitCountLabel in fruitCountLabels {
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitID) else {
                return
            }
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    func presentModifyView() {
        let ModifyInventoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModifyInventory")
        
        present(ModifyInventoryVC, animated: true, completion: nil)
    }
    
}

