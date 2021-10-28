//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    let juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)
    
    enum JuiceMakerError: LocalizedError {
        case notFoundID
        case notFoundJuice
        case notFoundFruitCount
        
        var errorDescription: String? {
            switch self {
            case .notFoundFruitCount:
                return "과일의 갯수를 찾을 수 없습니다."
            case .notFoundID:
                return "스토리보드에서 UI요소에 ID가 지정되지 않았습니다."
            case .notFoundJuice:
                return "과일 ID에 해당하는 과일 케이스를 찾을 수 없습니다."
            }
        }
    }

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
                throw JuiceMakerError.notFoundID
            }
            guard let orderedjuice = JuiceMaker.Juice.findJuice(juiceID: juiceID) else {
                throw JuiceMakerError.notFoundJuice
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
                    throw JuiceMakerError.notFoundID
                }
                guard let fruitCount = FruitStore.shared.getFruitCount(by: fruitID) else {
                    throw JuiceMakerError.notFoundFruitCount
                }
                fruitCountLabel.text = String(fruitCount)
            }
        } catch {
            print("ERROR \(error): \(error.localizedDescription)")
        }
    }
    
    func presentModifyView() {
        let ModifyInventoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModifyInventory")
        
        present(ModifyInventoryVC, animated: true, completion: nil)
    }
    
}

