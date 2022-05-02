//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stockStrawberryCount: UILabel!
    @IBOutlet weak var stockBananaCount: UILabel!
    @IBOutlet weak var stockPineappleCount: UILabel!
    @IBOutlet weak var stockKiwiCount: UILabel!
    @IBOutlet weak var stockMangoCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bringStockFruitCount()
    }

    func bringStockFruitCount() {
        stockStrawberryCount.text = juiceMaker.fruitCount(fruitName: FruitKind.strawberry)
        stockBananaCount.text = juiceMaker.fruitCount(fruitName: FruitKind.banana)
        stockPineappleCount.text = juiceMaker.fruitCount(fruitName: FruitKind.pineapple)
        stockKiwiCount.text = juiceMaker.fruitCount(fruitName: FruitKind.kiwi)
        stockMangoCount.text = juiceMaker.fruitCount(fruitName: FruitKind.mango)
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpCompleteButton(_ sender: UIButton) {
        showAlert(message: "Coming soon!")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}


