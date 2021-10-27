//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderJuiceViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        strawberryStockLabel.text = "\(juiceMaker.store.inventory[0].count)"
        bananaStockLabel.text = "\(juiceMaker.store.inventory[1].count)"
        pineappleStockLabel.text = "\(juiceMaker.store.inventory[2].count)"
        kiwiStockLabel.text = "\(juiceMaker.store.inventory[3].count)"
        mangoStockLabel.text = "\(juiceMaker.store.inventory[4].count)"
    }

    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showLackOfStockAlert(message: String) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(identifier: "EditStockNavigation") else {
            return
        }
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정",
                                     style: .default) { (action) in
            self.present(editStockViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

