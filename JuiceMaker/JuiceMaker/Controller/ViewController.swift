//
//  JuiceMaker - ViewController.swift
//  Created by 써니쿠키, 써머캣
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var changeFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceButton:
            juiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        case mangoKiwiJuiceButton:
            juiceMaker.makeJuice(.mangoKiwiJuice, total: 1)
        case strawberryJuiceButton:
            juiceMaker.makeJuice(.strawberryJuice, total: 1)
        case bananaJuiceButton:
            juiceMaker.makeJuice(.bananaJuice, total: 1)
        case pineappleJuiceButton:
            juiceMaker.makeJuice(.pineappleJuice, total: 1)
        case kiwiJuiceButton:
            juiceMaker.makeJuice(.kiwiJuice, total: 1)
        case mangoJuiceButton:
            juiceMaker.makeJuice(.mangoJuice, total: 1)
        default:
            return
        }
    }
    
    
    
    

    func moveToFruitStockVC() {
        guard let fruitStoreStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "fruitStoreStock") else { return }
        self.present(fruitStoreStockViewController, animated: true, completion: nil)
    }

    @IBAction func touchUpChangeFruitStockButton(_ sender: Any) {
        moveToFruitStockVC()
    }
    
}

