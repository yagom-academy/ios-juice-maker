//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    var juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitCount()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        guard let juiceID = sender.restorationIdentifier else {
            return
        }
        
        guard var juiceCase = JuiceMaker.Juice.allCases.filter({ $0 == juiceID }).first else {
            return
        }
        
        guard let juice = juiceMaker.order(juice: juiceCase) else {
            // 주문 실패
            failureAlertMessage()
            return
        }
        
        // 주문성공
        successAlertMessage(juiceID)
    }
    
    func failureAlertMessage() {
        let alert = UIAlertController(title: "주스 제조 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "확인", style: .default, handler: { _ in
            print("재고 수정 화면 이동")
        })
        let alertCancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
    }
    
    func successAlertMessage(_ juiceID: String) {
        let alert = UIAlertController(title: "주스 제조 완료", message: "\(juiceID) 제조가 완료되었습니다.", preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "확인", style: .default)
        let alertCancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateFruitCount() {
        let fruitCountList: [FruitStore.Fruits: Int] = FruitStore.shared.inventoryStatus
        
        for fruitCountLabel in fruitCountLabels {
            
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            
            guard let kindOfFruit = FruitStore.Fruits(rawValue: fruitID) else {
                return
            }
            
            guard let fruitCount = fruitCountList[kindOfFruit] else {
                return
            }
            
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    
}

