//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet var modifiedFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet var strawbananaJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = juiceMaker.viewFruitStock(fruitName: .strawberry)
        bananaLabel.text = juiceMaker.viewFruitStock(fruitName: .banana)
        pineappleLabel.text = juiceMaker.viewFruitStock(fruitName: .pineapple)
        kiwiLabel.text = juiceMaker.viewFruitStock(fruitName: .kiwi)
        mangoLabel.text = juiceMaker.viewFruitStock(fruitName: .mango)
    }
    
    @IBAction func orderStrawbananaJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .strawberryBanana)
    }
    
    
    @IBAction func modifiedFruitStockButtonClicked(_ sender: UIBarButtonItem) {
        guard let FruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else {
            return
        }
        self.navigationController?.pushViewController(FruitStockViewController, animated: true)
    }
    
    
    func showJuiceHandleResult(juiceMenu: JuiceMenu) {
        let juiceResult = juiceMaker.makeJuice(juiceMenu: juiceMenu, amount: 1)
        switch juiceResult {
        case .success(let message):
            print(message)
        case .failure(.outOfStock):
            print("재고가 없습니다")
        }
    }
}

