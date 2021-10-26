//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitCount()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        let juiceID = sender.restorationIdentifier
        
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

