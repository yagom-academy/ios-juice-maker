//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet private var fruitLabels: [UILabel]!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateInventory()
    }
    
    func updateInventory() {
        fruitLabels.forEach { label in
            if let identifier = label.accessibilityIdentifier,
               let fruit = Fruit.init(rawValue: identifier),
               let inventory = juiceMaker.fruitStore.inventoryList[fruit] {
                label.text = "\(inventory)"
            }
        }
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let identifier = sender.accessibilityIdentifier,
              let juice = Juice.init(rawValue: identifier) else {
                  return
              }
        let result = juiceMaker.make(juice)
        switch result {
        case .success(let juice):
            updateInventory()
            let successMessage = "\(juice.name) 나왔습니다! 맛있게 드세요!"
            showSuccessAlert(message: successMessage)
        case .failure:
            showfailureAlert()
        }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showfailureAlert() {
        let message = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예",
                                     style: .default) { (action) in
            self.presentModifyingInventoryView()
        }
        let cancleAction = UIAlertAction(title: "아니오",
                                         style: .default,
                                         handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func presentModifyingInventoryView() {
        guard let modifyingInventoryViewController = storyboard?.instantiateViewController(withIdentifier: ModifyingInventoryViewController.identifier) as? ModifyingInventoryViewController else {
            return
        }
        present(modifyingInventoryViewController,
                animated: true,
                completion: nil)
    }
}

