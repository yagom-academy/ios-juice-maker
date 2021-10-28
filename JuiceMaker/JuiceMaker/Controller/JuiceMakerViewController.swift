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
        do {
            guard let juiceID = sender.restorationIdentifier else {
                throw FruitError.notFoundID(self,"UIButton")
            }
            guard let orderedjuice = JuiceMaker.Juice.findJuice(juiceID: juiceID) else {
                throw FruitError.notFoundJuice
            }
            
            if let madejuice = juiceMaker.order(juice: orderedjuice) {
                alertMessage(title: "주스 제조 완료", message: "\(madejuice) 제조가 완료되었습니다.")
            } else {
                alertMessage(title: "주스 제조 실패", message: "재료가 모자라요. 재고를 수정할까요?") { _ in
                    self.presentModifyView()
                }
            }
            
        } catch {
            print("ERROR \(error): \(error.localizedDescription)")
        }
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
        do {
            for fruitCountLabel in fruitCountLabels {
                guard let fruitID = fruitCountLabel.restorationIdentifier else {
                    throw FruitError.notFoundID(self,"UIlabel")
                }
                guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitID) else {
                    throw FruitError.notFoundFruitCount
                }
                fruitCountLabel.text = String(fruitCount)
            }
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    func presentModifyView() {
        let ModifyInventoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModifyInventory")
        
        present(ModifyInventoryVC, animated: true, completion: nil)
    }
    
}

