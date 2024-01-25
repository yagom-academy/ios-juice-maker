//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet var modifiedFruitStockButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showJuiceHandleResult()
    }
    
    
    @IBAction func modifiedFruitStockButtonClicked(_ sender: UIBarButtonItem) {
        guard let FruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else {
            return
        }
        self.navigationController?.pushViewController(FruitStockViewController, animated: true)
    }
    
    
    func showJuiceHandleResult() {
        let juiceResult = juiceMaker.makeJuice(juiceMenu: .strawberryBanana, amount: 1)
        switch juiceResult {
        case .success(let message):
            print(message)
        case .failure(.outOfStock):
            print("재고가 없습니다")
        }
    }
}

