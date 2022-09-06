//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var fruitLabels: [UILabel]!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateInventory()
    }
    
    func updateInventory() {
        let errorValue = -1
        
        fruitLabels.forEach {
            if let fruit = Fruit.init(rawValue: $0.tag) {
                $0.text = "\(FruitStore.shared.inventoryList[fruit] ?? errorValue)"
            }
        }
    }
 
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        if let juice = Juice.init(rawValue: sender.tag) {
            juiceMaker.make(juice)
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
}

