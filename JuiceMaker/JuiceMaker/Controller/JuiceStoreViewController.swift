//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockCountLabel()
        showSuccesAlert()
    }
    
    func updateFruitStockCountLabel() {
        strawberryCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .pineapple)
        kiwiCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
    
    @IBAction func moveEditFruitStockViewController(_ sender: Any) {
        guard let editFruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditFruitStockViewControlle") else { return }
        self.present(editFruitStockViewController, animated: true, completion: nil)
    }
    
    func showSuccesAlert() {
        let successAlert = UIAlertController(title: "타이틀입니다.",
                                            message: "메세지입니다.",
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "okActioin입니다.",
                                     style: .default,
                                     handler: nil)
        successAlert.addAction(okAction)
        present(successAlert, animated: true, completion: nil)
    }
}
