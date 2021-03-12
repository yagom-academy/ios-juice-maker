//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    @IBAction func juiceOrderButton(_ sender: Any) {
        let kindOrderButton = sender as! UIButton
        print("\(kindOrderButton.currentTitle!)")
    }
    
    override func viewDidLoad() {
        let juiceMaker = JuiceMaker()
        let totalFruitStock = juiceMaker.currentFruitStock()
        
        strawberryLabel.text = String(totalFruitStock[.strawberry]!)
        bananaLabel.text = String(totalFruitStock[.banana]!)
        pineappleLabel.text = String(totalFruitStock[.pineapple]!)
        mangoLabel.text = String(totalFruitStock[.mango]!)
        kiwiLabel.text = String(totalFruitStock[.kiwi]!)
    }
    
    // 에러 안나면
    @IBAction func orderAlert(_ sender: Any) {
        let juiceName: String = "**"
        
        let alert = UIAlertController(title: "주문 확인", message: "\(juiceName)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // 에러 나면
    
    @IBAction func failOrder(_ sender: Any) {
        let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "아니오", style: .default, handler : nil )
        let stockSettingAction = UIAlertAction(title: "예", style: .cancel){ (action) in
            
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)

        present(failAlert, animated: true, completion: nil)
    }

}

