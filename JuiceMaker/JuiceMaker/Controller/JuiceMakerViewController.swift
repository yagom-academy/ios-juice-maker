//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitCount()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: Notification.Name("changedInventory"),
            object: nil)
        
        
        for (index, data) in Fruits.allCases.enumerated() {
            fruitCountLabels[index].fruitID = data.description
        }
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { }
    
    @IBOutlet var fruitCountLabels: [FruitLabel]!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        do {
            guard let juiceID = sender.restorationIdentifier else {
                throw FruitError.notFoundID(self, "UIButton")
            }
            guard let wantedJuice = Juice.findJuice(juiceID: juiceID) else {
                throw FruitError.notFoundJuice
            }
            tryOrder(juice: wantedJuice)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    private func tryOrder(juice: Juice) {
        if let madejuice = juiceMaker.order(juice: juice) {
            showAlert(title: "주스 제조 완료", message: "\(madejuice) 제조가 완료되었습니다.")
        } else {
            showAlert(title: "주스 제조 실패", message: "재료가 모자라요. 재고를 수정할까요?") { _ in
                self.presentModifyView()
            }
        }
    }
    
    private func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "확인", style: .default, handler: handler)
        let alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc
    private func updateFruitCount() {
        do {
            for (fruit, fruitCount) in FruitStore.shared.fruitInventory {
                guard let fruitCountLabel = fruitCountLabels.filter({
                    compare(fruit,by: $0.restorationIdentifier) }).first else {
                        throw FruitError.notFoundView(self, "Label")
                    }
                fruitCountLabel.text = String(fruitCount)
            }
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    private func presentModifyView() {
        let ModifyInventoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModifyInventory")
        
        present(ModifyInventoryVC, animated: true, completion: nil)
    }
    
    private func compare(_ fruit: Fruits, by fruitID: String?) -> Bool {
        guard let fruitID = fruitID, let foundfruit = Fruits.findFruit(by: fruitID) else {
            return false
        }
        return fruit == foundfruit
    }
}
